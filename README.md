
# Terraform-ECS
This is a boilerplate IAAC with Terraform for creating ECS service with AWS.  In most cases I will use this for deploying a react app and api's. A CI/CD pipeline will also be created to keep application up-to-date and continue with new integrations.

Firstly, install Terraform cli
https://learn.hashicorp.com/tutorials/terraform/install-cli


Prerequisites:
-	Terraform CLI
-	AWS CLI
-	Use your IAM credentials to authenticate the Terraform AWS provider:
    $ export AWS_ACCESS_KEY_ID="YOUR_AWS_ACCESS_KEY_ID"
    $ export AWS_SECRET_ACCESS_KEY="YOUR_AWS_SECRET_ACCESS_KEY"
    $ export AWS_DEFAULT_REGION="YOUR_AWS_DEFAULT_REGION"
    
Things to note:
•	Terraform Block - contains settings, including providers Terraform will use to provision the infrastructure.
•	For each provider, the source attribute defines an optional hostname, namespace and provider type
•	Providers - these configure the specified provider, in our case AWS.
•	The profile attribute refers to the AWS credentials stored in the AWS configuration file, which we create when we configured the AWS CLI
•	Use resource blocks to define components of the infrastructure. 
        
TODOS:
    We will create an AWS network infrastructure to deploy a React App and NodeJS API
    -	Dockize the application
    -	Create an image repository on AWS ECR and push the image
    -	Create AWS ECS Cluster
    -	Create AWS ECS Task
    -	Create AWS Service
    -	Create an Application Load Balancer
        
TO BE CONTINUED...
