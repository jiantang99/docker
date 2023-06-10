Tutorial on how to deploy multiple docker containers on ECS

Build the backend container by running "docker build -t backend-container ./backend'

Create public repository on Docker hub.

Rename the backend image to <username>/<repository name> by running:
"docker image tag backend-container <username>/<repository name>"

Push image to docker hub by running:
"docker push <username>/<repository name>:<tag name>"

Create ECS cluster on AWS console, and ensure Fargate (serverless) is ticked.

Create new task definition.
- Under 'Environment variables', go to 'Docker configuration' and add 'node,app.js' under 'Command'
- This is because, in the app, nodemon is used to update the source code whenever there are any code changes. This is not necessary in production.