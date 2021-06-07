# What is Terraform?

![logo](logo.png)


Terraform provides a common configuration to launch infrastructure — from physical and virtual servers to email and DNS providers. 
Once launched, Terraform safely and efficiently changes infrastructure as the configuration is evolved.

Simple file based configuration gives you a single view of your entire infrastructure.

See: https://www.terraform.io/

# Usage

To run Terraform commands, you can mount your project in a volume under `/app`. 

```
docker run -v ${PWD}:/app -w /app -it --rm 1science/terraform:0.13.7-python3.7 terraform plan  
```

# Build

This project is configured as an [automated build in Dockerhub](https://hub.docker.com/r/1science/terraform/). 

Each branch give the related image tag.  

# License

All the code contained in this repository, unless explicitly stated, is
licensed under ISC license.

A copy of the license can be found inside the [LICENSE](LICENSE) file.
