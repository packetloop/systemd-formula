{%- from "systemd/resolved/map.jinja" import resolved with context -%}
{%- from "systemd/resolved/macros.jinja" import files_switch with context -%}

resolved:
  file.managed:
    - name: /etc/systemd/resolved.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: {{ files_switch('systemd/resolved', ['/resolved.conf']) }}
    - listen_in:
      - service: resolved
  service.running:
    - name: systemd-resolved
    - enable: True

resolv.conf:
  file.symlink:
    - name: {{ resolved.resolv_file }}
    - target: {{ resolved.resolv_target }}
    - listen_in:
      - service: resolved