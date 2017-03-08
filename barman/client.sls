{%- from "barman/map.jinja" import client with context %}
{%- from "linux/map.jinja" import system with context %}

{%- if enabled %}

{%- if barman.dist == 'redhat' %}
barman:
  pkg.installed:
    - sources:
      - barman: {{ barman.repo }}
    - pkgs:
      - {{ barman.pkg }}
{%- endif %}



{%- if barman.dist == 'debian' %}
barmandeb:
  pkgrepo.managed:
    - humanname: Badman Deb Package
    - name: {{ barman.repo }}
    - dist: {{ barman.repodist }}
    - file: /etc/apt/sources.list.d/barman.list
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc
    - refresh_db: true

barman:
  pkg.installed

{%- endif %}

{%- endif %}