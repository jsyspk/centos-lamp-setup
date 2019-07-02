#!/usr/bin/env bash
projecroot='/usr/share/nginx/html/myapp'
semanage fcontext -a -t httpd_sys_rw_content_t '${projecroot}/storage(/.\*)?'
restorecon -R ${projecroot}/storage

semanage fcontext -a -t httpd_sys_rw_content_t '${projecroot}/bootstrap/cache(/.\*)?'
restorecon -R ${projecroot}/bootstrap/cache

chcon -R -t httpd_sys_rw_content_t ${projecroot}/storage

semanage fcontext -a -t httpd_sys_rw_content_t '${projecroot}/vendor/browscap/browscap-php/resources(/.\*)?'
restorecon -R ${projecroot}/vendor/browscap/browscap-php/resources
