{%- if pillar.barman is defined %}
{%- if pillar.barman.host is defined %}
include:
- barman.host
{%- endif %}
{%- endif %}