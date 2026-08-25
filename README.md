# numworx-dwo-setup
Everything to set up the Numworx services on a K8S cluster

## Introduction

In this project, a complete working numworx environment is build on a local K8S cluster, for example a K3S system with Traefik as ingress enabled, such as Rancher Desktop. After installation you may point your browser to http://app.numworx/ 
 
## Prerequisites

Before running this project, you must have installed the artifacts from several other Numworx projects:
* numworx-dwo-project, the **ebserver.war** artifact
* numworx-dwo-runner, the **initdb.jar** and **maintenaince.jar** artifacts
* numworx-dwo-resources, the **cds** container, the default is to access this container at http://cds.numworx/

## Contents 

### Folder structure

These three folders build containers as maven artifacts:
* initdb a container used as K8S init container. Generates the initial database layout.
* maintenance a container used as K8S cronjob
* EBDocker embed the ebserver.war in a tomcat 9 container

Other folders:
* docker-smtp, a fork of the [namshi/smtp](https://github.com/namshi/docker-smtp) container, builds arm and x86. See docker-smtp/README.md for details. You will have to configure yourself.
* prosody, builds a rudimentary prosody server, for chatting in numworx. Not used by default.
* k8s, deploys all containers to a K8S configuration, see k8s/README.md 

### How to build

Use maven with a java 11 distributions. 
There are several buildx.sh shell scripts to generate containers.

## Usage

Build all containers, then go to the k8s/local directory. After 
```
    kubectl apply -k .
```
you will have a running numworx web application running at http://app.numworx/
where app.numworx is an alias for localhost. see k8s/README.md for details and configuration.

## License

This work is licensed under the GNU General Public License version 3.
Copyright © 2026, Utrecht University, all rights reserved.

Docker-smtp is licenced MIT License, see docker-smtp/LICENSE

## Contact 
[Wim van Velthoven](mailto:w.p.g.vanvelthoven@uu.nl)
