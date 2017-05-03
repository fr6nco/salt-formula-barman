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

barman_service:
  service.running:
    - name: barman
    - enable: true
    - require:
      - pkg: barman_package

{%- endif %}