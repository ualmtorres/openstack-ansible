# Instalación automática de OpenStack Ocata con Ansible

![](doc/logoopenstackansible128x128.png)

Este playbook de Ansible está creado a partir de la [Guía de instalación oficial de OpenStack Ocata para Ubuntu](https://docs.openstack.org/ocata/install-guide-ubuntu/overview.html).

## Requisitos

* Máquina de control de Ansible
  * Ubuntu 16.04 LTS
  * Python 2.7.1
  * Ansible 2.3.1
* Máquinas remotas
  * Ubuntu 16.04 LTS
  * Python 2.7.1 (**IMPORTANTE: Ubuntu 16.04 instala Python 3. Por tanto, antes de comenzar a ejecutar el Playbook de esta instalación, debemos instalar Python 2.7 en cada una de las máquinas remotas: (`sudo apt-get update && sudo apt-get install python`)

---
**NOTA**

Trabajo en progreso: Actualmente, este playbook instala los componentes siguientes de OpenStack:

* Keystone
* Glance
* Nova
* Neutron
* Horizon
---

## Consideraciones

* Este playbook instala OpenStack en un nodo de control (`control`) y un nodo de cómputo (`compute01`).
* La instalación de OpenStack en los dos nodos remotos (`controller` y `compute01`) la haremos directamente desde el nodo de control de Ansible. Por tanto, los dos nodos remotos tendrán:
  * Una dirección IP accesible desde el nodo de control de Ansible. Las direcciones IP de los nodos remotos están en el archivo `hosts.cfg`.
  * La clave pública SSH correspondiente a clave SSH privada instalada en el nodo de control de Ansible.
* El archivo `group_vars/all.yml` contiene parámetros que se pueden ajustar a los valores que necesites para tu instalación de OpenStack (p.e. direcciones IP de los nodos de control y cómputo, nombre de las interfaces de red, contraseñas, ...).
* El usuario de las máquinas remotas es `ubuntu` (esto sólo es necesario para lanzar el despliegue).

> Esta instalación hace uso de los *módulos cloud*  de Ansible de OpenStack para la creación de proyectos, roles, usuarios y demás. Estos módulos están disponibles tras instalar el paquete `shade`, instalado una de las tareas de este playbook. Los módulos cloud de `shade` utilizan el archivo `clouds.yaml` para almacenar las credenciales. Si estás familiarizado con el uso de OpenStack mediante la consola, el archivo `clouds.yaml` es similar a los archivos `openrc` cuando usamos `openstack` CLI.

## Entorno

![](doc/architecture.png)

## Despliegue

Una vez ajustados los valores en `hosts.cfg` y `group_vars/all.yml` el despliegue se realiza en dos pasos debido a que es necesario reinciar las máquinas durante el proceso. Teniendo que cuenta que nuestro usuario en las máquinas remotas es `ubuntu`, es despliegue se haría con estas órdenes:

`$ ansible-playbook playbook-1.yml -u ubuntu`

_Esperar a que se reinicien las máquinas_

`$ ansible-playbook playbook-2.yml -u ubuntu`

<a rel="license" href="http://creativecommons.org/licenses/by/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.
