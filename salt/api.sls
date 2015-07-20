#!jinja|yaml

{% from "salt/map.jinja" import salt_settings with context %}

include:
  - salt.master
  - pip.extensions

{%- set cfg_salt = pillar.get('salt', {}) %}
{%- set cfg_master = cfg_salt.get('master', {}) %}

salt_api_install:
  pkg.installed:
    - name: {{ salt_settings['salt_api'] }}
  service.running:
    - name: {{ salt_settings.get('api_service', 'salt-api') }}
    - require:
{%- if 'rest_cherrypy' in cfg_master %}
      - pip: salt_api_cherrypy
{% elif 'rest_tornado' in cfg_master %}
      - pip: salt_api_tornado
{% endif %}
    - watch:
      - pkg: salt-master
      - file: salt-master

{%- if 'rest_cherrypy' in cfg_master %}
salt_api_cherrypy:
  pkg.purged:
    - name: {{ salt_settings['python-cherrypy'] }}
  pip.installed:
    - name: cherrypy
    - require:
      - pkg: salt_api_cherrypy
      - pkg: pip_extensions
{% endif %}

{%- if 'rest_tornado' in cfg_master %}
salt_api_tornado:
  pkg.purged:
    - name: {{ salt_settings['python-tornado'] }}
  pip.installed:
    - name: tornado
    - require:
      - pkg: salt_api_tornado
      - pkg: pip_extensions
{% endif %}
