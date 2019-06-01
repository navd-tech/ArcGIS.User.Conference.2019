#!/bin/bash

# To use:
## 1) run script in terminal shell.
## 2) copy the url provided in the startup output into a browser.

# The user will need to provide any required ArcGIS credentials.

# This builds a local instance of single user Jupyter notebook server
# which is based on esri provided version.  The local instance is
# modified slightly so that the container listens on all ports and so that 
# the 'work' and 'shared' local subdirectory are visible from the
# notebook.

# This requires the local machine to be running docker.
# This provides a directory for shared notebooks but no special support for
# finding or sharing them.
# This works on OSX.  It probably works on linux. This won't work as written
# on Windows.

## Limitations:
# - Notebook is not itself secure, but since any new content is not public
# or shared by the server itself so the security responsibilites lie on the user. 

#### TODO:
# TEST: Setup 'shared' directory so that can fill that from github / shared notebooks?
# Does this need to be secure?  It is single user running on a local server.

set -x

IMG_TAG=myownprivatejupyter

# Alwasy rebuild the container to get the most recent version.
docker build -t ${IMG_TAG} .

# Below is Docker syntax to map an in-container and an external directory. This
# argument can be supplied multiple times.

WORK_VOL="-v $(pwd)/work:/home/jovyan/work"
SHARED_VOL="-v $(pwd)/shared:/home/jovyan/shared"
DATA_VOL ="-v $(pwd)/data:/home/jovyan/data"


# add any additional volume mappings to this string.
VOLS=" ${WORK_VOL} ${SHARED_VOL} "

docker run -it --rm -p 8888:8888 ${VOLS} ${IMG_TAG}

# NOTES:
# host name can get confusing: see https://jupyter-notebook.readthedocs.io/en/latest/public_server.html#docker-cmd for suggestions if this isn't good enough.
#end