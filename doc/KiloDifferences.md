# Ocata differences compared to Kilo Install Guide

## In Kilo Install Guilde

### Pag 40

Disable the keystone service from starting automatically after installation:

\# echo "manual" > /etc/init/keystone.override


Edit the /etc/keystone/keystone.conf file and complete the following actions:
a. In the [DEFAULT] section, define the value of the initial administration token:
[DEFAULT]
...
admin_token = ADMIN_TOKEN

### Pag 56

In the [DEFAULT] section, configure the noop notification driver to disable notifi-
cations because they only pertain to the optional Telemetry service:

[DEFAULT]
...
notification_driver = noop

The Telemetry chapter provides an Image service configuration that enables notifications.

### Pag 75

Paquetes (La X indica que está en Kilo también. Si no tiene X, sólo es de Ocata):

- X neutron-server
- X neutron-plugin-ml2
- neutron-linuxbridge-agent
- neutron-l3-agent
- neutron-dhcp-agent
- neutron-metadata-agent

### Pag 77

In the [DEFAULT] and [nova] sections, configure Networking to notify Com-
pute of network topology changes:

[DEFAULT]
...
nova_url = http://controller:8774/v2
