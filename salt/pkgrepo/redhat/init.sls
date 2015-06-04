{% from "salt/map.jinja" import salt_settings with context %}

saltstack-zeromq4:
  pkgrepo.managed:
    - humanname: Copr repo for zeromq4 owned by saltstack
    - baseurl: http://copr-be.cloud.fedoraproject.org/results/saltstack/zeromq4/{{ salt_settings.repotype }}-$releasever-$basearch/
    - gpgcheck: 1
    - gpgkey: https://copr-be.cloud.fedoraproject.org/results/saltstack/zeromq4/pubkey.gpg
    - skip_if_unavailable: True
    - enabled: 1
