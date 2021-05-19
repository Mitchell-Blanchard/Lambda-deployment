# Terraform lambda deployment

This project is to demonstrate the deployment of a javascript API into AWS Lambda with Terraform. It is currently deployed and is accessible via the links below.
- Cloudfront: https://d2nh37w45bds8y.cloudfront.net
- API Gateway: https://xd5hywxbwg.execute-api.ap-southeast-2.amazonaws.com

#####Project Structure
```
.
├── README.md
├── handler.js
└── terraform
    ├── module
    │   ├── apigateway.tf
    │   ├── lambda_cloudfront.tf
    │   ├── lambda_function.tf
    │   ├── lambda_role.tf
    │   ├── lambda_support_policy.tf
    │   └── variables.tf
    └── production
        ├── main.tf
```

Within the terraform folder there are 2 folders, the modules folder and production folder. `module` contains the modules that are used for each piece of the deployment. `production` consolidates the modules for use in a single deployment and provides the varibles that are needed.

####What are the modules?
1. `apigateway`: Used to build the gateway to invoke the lambda.
1. `lambda_cloudfront`: used to deploy a cloudfront distribution infront of the API gateway to allow for greater scalability, caching and edge deployments.
1. `lambda_function`: Builds the lambda package `./handler.zip` from `./handler.js` then deploys the API to AWS lambda and enables cloudwatch logs.
1. `lambda_role`: builds an IAM role with permissions to assume role and deploy cloudwatch metrics.
1. `lambda_support_policy`: builds a policy for operation users to access and be able to manage the app for performance and operational needs.

######assumption: I have taken the assumption here that the user is called `lambda_support_user`

####How to deploy:
1. Install terraform
  Instructions can be found [here](https://learn.hashicorp.com/tutorials/terraform/install-cli "here")
1. Install and setup AWS-CLI
Instructions can be found [here](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html "here")
1. change directory to `./terraform/production` and run `terraform init`, this will initialize the project in the working directory.
1. run `terraform apply`
review the changes and confirm the deployment.