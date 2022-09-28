locals {

  name            = basename(path.cwd)
  region          = data.aws_region.current.name
  cluster_version = "1.23"

  vpc_cidr = "10.0.0.0/16"
  azs      = slice(data.aws_availability_zones.available.names, 0, 3)

  istio_charts_url = "https://istio-release.storage.googleapis.com/charts"
  istio_version    = "1.15.1"

  addon_application = {
    path               = "chart"
    repo_url           = "https://github.com/aws-samples/eks-blueprints-add-ons.git"
    add_on_application = true
  }

  workload_application = {
    path               = "envs/dev"
    repo_url           = "https://github.com/ovaleanu/eks-blueprints-workloads.git"
    add_on_application = false
  }

  ecsdemo_application = {
    path               = "multi-repo/argo-app-of-apps/dev"
    repo_url           = "https://github.com/ovaleanu/eks-blueprints-workloads.git"
    add_on_application = false
  }

  tags = {
    Blueprint  = local.name
    GithubRepo = "github.com/aws-ia/terraform-aws-eks-blueprints"
  }
}
