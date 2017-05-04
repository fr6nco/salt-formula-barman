{%- from "barman/map.jinja" import host with context %}

{%- if host.enabled %}

{%- if grains.os == 'Ubuntu' %}
postgres_repo:
  pkgrepo.managed:
    - humanname: PostgreSQL repo
    - name: deb http://apt.postgresql.org/pub/repos/apt/ {{grains.oscodename}}-pgdg main
    - dist: {{grains.oscodename}}-pgdg
    - file: /etc/apt/sources.list.d/pgdg.list
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
    - refresh_db: true
{% endif %}

barman_package:
  pkg.installed:
    - name: barman

/etc/barman.conf:
  file.managed:
    - source: salt://barman/files/barman.conf
    - template: jinja
    - requrie:
      - pkg: barman_package

## should be created automaticallly anyways
barman:
  user.present:
    - fullname: Billy Barman
    - shell: /bin/bash
    - home: /var/lib/barman

/var/lib/barman/.ssh:
  file.directory:
    - user: barman
    - group: barman
    - mode: 0700
    - maktedirs: true

{% if not salt['file.file_exists']('/var/lib/barman/.ssh/id_rsa') %}
genrsakey:
  cmd.run:
    - name: ssh-keygen -b 2048 -t rsa -f /var/lib/barman/.ssh/id_rsa -q -N ""

/var/lib/barman/.ssh/id_rsa:
  file.managed:
    - user: barman
    - group: barman
    - mode: 0500

/var/lib/barman/.ssh/id_rsa.pub:
  file.managed:
    - user: barman
    - group: barman
    - mode: 0500
{% endif %}


{% for key,backup in host.backups.iteritems() %}

/etc/barman.d/{{key}}.conf:
  file.managed:
    - user: barman
    - group: barman
    - mode: 0777
    - template: jinja
    - source: salt://barman/files/streaming-template.conf
    - context:
        backup: {{backup}}

/etc/barman.d/{{key}}.conf:
  file.managed:
    - user: barman
    - group: barman
    - mode: 0777
    - template: jinja
    - source: salt://barman/files/ssh-template.conf
    - context:
        backup: {{backup}}

{% endfor %}

{%- endif %}