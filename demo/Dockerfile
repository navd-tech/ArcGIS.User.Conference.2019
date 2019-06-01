FROM esridocker/arcgis-api-python-notebook

# for 'docker run'
#-v c:/Users/xr_xa/Documents/GitHub/NavD/ArcGIS.User.Conference.2019:/home/jovyan/work 
#- Mounts a host machine directory as folder
# in the container. Useful when you want to preserve notebooks and other work even after
# the container is destroyed. You must grant the within-container notebook user or
# group (NB_UID or NB_GID) write access to the host directory
# (e.g., sudo chown 1000 /some/host/folder/for/work).

# by default runs with uid=1000(jovyan) gid=100(users) groups=100(users)
## --ip means listen on all ports.  Required so that intra-notebook links work.
CMD ["start-notebook.sh", "--ip=0.0.0.0"]
#end