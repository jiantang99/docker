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
- Enter environment variables specified in env folder (MONGODB_USERNAME, MONGODB_PASSWORD, MONGODB_URL = localhost)

Add another container to the same task definition (Create new revision)
- Use 'mongo' for image name (Official image from docker hub)
- Map port 27017 (Default port mapping for mongodb)
- Enter environment variables for mongo.env 

Create service for ECS cluster
- Select 'Launch type', and then FARGATE for the launch type
- Select 'Task' under 'Application type', and select the task created above under the 'Family' option

To use Application Load Balancer for the ECS cluster:
- Create application load balancer, use port 80 as the 'Load Balancer Port', and ensure the same VPC is used for the ECS cluster. 
- Ensure the Load Balancer is also internet facing
- Select IP target type for Target group

Use the public IP provided by the load balancer to access containers from internet.