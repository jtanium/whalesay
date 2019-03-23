workflow "Build and push to Docker Hub" {
  on = "push"
  resolves = ["https://github.com/actions/docker/tree/8cdf801b322af5f369e00d85e9cf3a7122f49108/login"]
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
