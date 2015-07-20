#!jinja|yaml

{% from "salt/map.jinja" import salt_settings with context %}

include:
  - salt.master
  - pip.extensions

{%- set cfg_salt = pillar.get('salt', {}) %}
{%- set cfg_master = cfg_salt.get('master', {}) %}

salt-api:
  pkg.installed:
    - name: {{ salt_settings['salt-api'] }}
  service.running:
    - name: {{ salt_settings.get('api_service', 'salt-api') }}
    - require:
      - service: {{ salt_settings.get('api_service', 'salt-api') }}
{%- if 'rest_cherrypy' in cfg_master %}
      - pip: salt-api-cherrypy
{% elif 'rest_tornado' in cfg_master %}
      - pip: salt-api-tornado
{% endif %}
    - watch:
      - pkg: salt-master
      - file: salt-master

{%- if 'rest_cherrypy' in cfg_master %}
salt-api-cherrypy:
  pkg.purged:
    - name: {{ salt_settings['python-cherrypy'] }}
  pip.installed:
    - name: cherrypy
    - require:
      - pkg: salt-api-cherrypy
      - pkg: pip_extensions
{% endif %}

{%- if 'rest_tornado' in cfg_master %}
salt-api-tornado:
  pkg.purged:
    - name: {{ salt_settings['python-tornado'] }}
  pip.installed:
    - name: tornado
    - require:
      - pkg: salt-api-tornado
      - pkg: pip_extensions
{% endif %}
