{%- if pillar.barman is defined %}
include:
{%- if pillar.barman.host is defined %}
- barman.host
{%- endif %}
{%- endif %}