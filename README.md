Role Name
=========

El rol instala rust 1.70 sobre Debian 11.

Requirements
------------


Role Variables
--------------


Dependencies
------------

Example Playbook
----------------
```
- hosts: builder-axum
  vars:
    ruta_rust: '~/ansible/roles/rust_role'
  roles: 
    - "{{ ruta_rust }}"
```
License
-------


Author Information
------------------

