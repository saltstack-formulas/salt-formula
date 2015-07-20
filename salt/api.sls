#!jinja|yaml

{% from "salt/map.jinja" import salt_settings with context %}

{%- set cfg_salt = pillar.get('salt', {}) %}
{%- set cfg_master = cfg_salt.get('master', {}) %}
{%- set use_pip = salt['pillar.get']('salt:api:use_pip', False) %}

include:
  - salt.master
{%- if use_pip %}
  - pip.extensions
{%- endif %}

salt_api_install:
  pkg.installed:
    - name: {{ salt_settings['salt_api'] }}
  service.running:
    - name: {{ salt_settings.get('api_service', 'salt-api') }}
    - require:
{%- if use_pip %}
{%- if 'rest_cherrypy' in cfg_master %}
      - pip: salt_api_cherrypy
{%- elif 'rest_tornado' in cfg_master %}
      - pip: salt_api_tornado
{%- endif %}
{%- else %} # if use_pip
{%- if 'rest_cherrypy' in cfg_master %}
      - pkg: salt_api_cherrypy
{%- elif 'rest_tornado' in cfg_master %}
      - pkg: salt_api_tornado
{%- endif %}
{%- endif %}
    - watch:
      - pkg: salt-master
      - file: salt-master

{%- if use_pip %}
{%- if 'rest_cherrypy' in cfg_master %}
salt_api_cherrypy:
  pkg.purged
    - name: {{ salt_settings.python_cherrypy }}
  pip.installed
    - name: cherrypy
    - require:
      - pkg: salt_api_cherrypy
      - pkg: pip_extensions
{% endif %}

{%- if 'rest_tornado' in cfg_master %}
salt_api_tornado:
  pkg.purged
    - name: {{ salt_settings.python_tornado }}
  pip.installed
    - name: tornado
    - require:
      - pkg: salt_api_tornado
      - pkg: pip_extensions
{% endif %}

{%- else %} # if use_pip

{% if 'rest_cherrypy' in cfg_master %}
salt_api_cherrypy:
  pkg.installed
    - name: {{ salt_settings.python_cherrypy }}
{% endif %}

{% if 'rest_tornado' in cfg_master %}
salt_api_tornado:
  pkg.installed
    - name: {{ salt_settings.python_tornado }}
{% endif %}
{%- endif %}
