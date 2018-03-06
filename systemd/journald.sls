{%- set journald = pillar['systemd']['journald'] %}
setup-systemd-journald-conf:
  file.managed:
    - name: /etc/systemd/journald.conf
    - contents:
        {{ journald }}
         
restart-systemd-journald:
  service.running:
    - name: systemd-journald
    - enable: True
    - watch:
      - file: /etc/systemd/journald.conf