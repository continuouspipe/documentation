---
title: Configuring Your Repository
menu:
  main:
    parent: 'quick-start'
    weight: 50

weight: 50
---
At this stage you should have a fully configured project, so it's time to configure your code repository by adding the configuration files that are needed to build a Docker image and set up ContinuousPipe deployments.

```
.
├── Dockerfile
├── continuous-pipe.yml
└── docker-compose.yml
```

## Add a Dockerfile

The first step is to add a `Dockerfile` to the root directory of your project. This file contains a series of commands that are combined to build a Docker image.

```
FROM nginx

COPY . /usr/share/nginx/html
```

This very basic `Dockerfile` will add an `nginx` web server container to the Docker image and copy the contents of the code repository into the web server default content directory.

See https://docs.docker.com/engine/reference/builder/ for full documentation.

## Add a docker-compose.yml

The next step is to add a `docker-compose.yml` to the root directory of your project. This file contains YAML configuration for the services, networks and volumes of a Docker image.

```
web:
    build: .
    expose:
        - 80
```

This YAML will configure the web service to run on port 80.

See https://docs.docker.com/compose/compose-file/ for full documentation.

## Add a continuous-pipe.yml

The next step is to add a `continuous-pipe.yml` to the root directory of your project. This file contains YAML configuration relating to the deployment of a Docker image.

```
tasks:
    images:
        build:
            services:
                web:
                    image: docker.io/pswaine/hello-world

    deployment:
        deploy:
            cluster: hello-world
            services:
                web:
                    specification:
                        accessibility:
                            from_external: true
```

This YAML does the following:

- It will configure the Docker image to be called `hello-world` and stored in an account at docker.io
- It will configure the Docker image to be deployed to the `hello-world` cluster - this cluster identifier is defined when [configuring a cluster]({{< relref "configuring-a-cluster.md" >}})
- It will configure the Kubernetes cluster to create a public load-balancer for the web service allowing public access

See [configuring deployments]({{< relref "configuration/deployments.md" >}}) for more documentation.

**These new configuration files then need pushing to your code repository so that ContinuousPipe can read them.**
