workflow "Build and Push to Docker Hub" {
  on = "push"
  resolves = ["Push Image to Docker Hub"]
}

action "Build Container" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "build -t nikovirtala/whalesay:latest ./image/"
}

action "Login to Docker Hub" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  needs = ["Build Container"]
}

action "Push Image to Docker Hub" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Login to Docker Hub"]
  args = "push nikovirtala/whalesay:latest"
}
