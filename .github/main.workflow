workflow "Build and push to Docker Hub" {
  on = "push"
  resolves = [
    "https://github.com/actions/docker/tree/8cdf801b322af5f369e00d85e9cf3a7122f49108/login",
    "GitHub Action for Docker-2",
  ]
}

action "GitHub Action for Docker" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  args = "build -t nikovirtala/whalesay ."
}

action "Docker Login" {
  uses = "actions/docker/login@master"
  secrets = ["DOCKER_USERNAME", "DOCKER_PASSWORD"]
  needs = ["GitHub Action for Docker"]
}

action "GitHub Action for Docker-1" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
}

action "Docker Registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["GitHub Action for Docker-1"]
}

action "GitHub Action for Docker-2" {
  uses = "actions/docker/cli@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  needs = ["Docker Registry"]
}