Tutorial on how to deploy multiple docker containers on ECS

Build the backend container by running "docker build -t backend-container ./backend'

Create public repository on Docker hub.

Rename the backend image to <username>/<repository name> by running:
"docker image tag backend-container <username>/<repository name>"

Push image to docker hub by running:
"docker push <username>/<repository name>:<tag name>"