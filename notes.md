# Theory

### Benefits of Infrastructure as Code

- Brings Dev and Ops together upfront
- Consistent configurations
- Faster deployments
- Less documentation - code is documentation
- Traceability - code in repository

### DevOps Pipeline

1. Develop - VSCode
2. Commit - GitHub
3. Build - Docker (using Azure DevOps)
4. Publish - DockerHub (using Azure DevOps)
5. Provision and Deploy - Terrform
6. Operate - Azure

When finished, push to github is only manual step

# Procedure

- Initial setup
  - `dotnet new webapi`
  - Comment out UseHttpsRedirection() from Program
- Docker
  - `code Dockerfile`
  - `docker build -t kevingineering/terraform .`
  - `docker run -p 8080:80 kevingineering/terraform`
- Git
  - `code .gitignore`
  - `git init`
  - `git add .`
