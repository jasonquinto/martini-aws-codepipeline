# Project Build Configuration

This repository contains two buildspec files for AWS CodePipeline, designed to facilitate different build processes depending on your project's needs. The buildspec files handle tasks such as building Docker images for the Martini runtime and uploading Martini packages.

To integrate these pipelines into another project, create a `buildspec.yaml` file at the root of your repository and use the `aws codepipeline start-pipeline-execution --name pipeline-name` command to trigger the appropriate pipeline.

## Buildspec Files

- **`martini-build-image.yaml`**: This buildspec is responsible for building and pushing Docker images for the Martini runtime.
- **`martini-upload-package.yaml`**: This buildspec is responsible for zipping and uploading Martini packages to the appropriate API endpoint.

## Getting Started

### Step 1: Clone the Repository

Clone this repository to your local machine.

### Step 2: Choose the Appropriate Buildspec

Determine which buildspec is suitable for your project, and ensure it is placed in the root directory of your repository.

### Step 3: Update Environment Variables

Ensure that sensitive variables such as tokens, credentials, and URLs are securely managed by passing them as environment variables when triggering the build. These should be configured either in your local environment or in your CI/CD pipeline configuration.

### Step 4: Execute the Build

Commit and push your changes to your repository. AWS CodePipeline will automatically pick up the `buildspec.yaml` file from the root and execute the build. Alternatively, trigger the pipeline using the AWS CLI command: `aws codepipeline start-pipeline-execution --name pipeline-name`.

## Environment Variables

The following environment variables are required for configuring this build process. These variables should be passed as environment variables when running the scripts or configuring your CI/CD pipeline:

| **Variable Name**             | **Required** | **Description**                                                                                                         |
|-------------------------------|--------------|-------------------------------------------------------------------------------------------------------------------------|
| `MARTINI_VERSION`             | Yes          | The version of the Martini runtime to be used when building the Docker image.                                           |
| `AWS_REGION`                  | Yes          | The AWS region where your ECR repository is located.                                                                   |
| `AWS_ACCOUNT_ID`              | Yes          | The AWS account ID where the ECR repository is hosted.                                                                 |
| `ECR_REPO_NAME`               | Yes          | The name of the ECR repository where the Docker image will be pushed.                                                  |
| `BASE_URL`                    | Yes          | The base URL for the API endpoint where packages will be uploaded and requests are made.                                |
| `MARTINI_USER_NAME`           | Yes          | The username for authentication with the Martini API.                                                                   |
| `MARTINI_USER_PASSWORD`       | Yes          | The password for authentication with the Martini API.                                                                   |

## Input Descriptions

- **`DOCKER_IMAGE_NAME`**: 
  - Specifies the name and tag of the Docker image to be built. This should be in the format `repository:tag` and is used for both building and tagging the Docker image.

- **`MARTINI_VERSION`**:
  - The version of the Martini runtime used in the Docker image. This is passed as a build argument during the Docker build process.

- **`BASE_URL`**:
  - The base URL of the remote Martini Runtime Server used for uploading packages.

- **`MARTINI_USER_NAME`** and **`MARTINI_USER_PASSWORD`**:
  - These are the credentials used to authenticate with the Martini API. They are required for fetching OAuth tokens and interacting with the Martini API during the package upload process.
