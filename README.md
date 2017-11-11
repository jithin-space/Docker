# Docker Repository

This repository contains the activites that I had done for exploring docker and will stand as an example how docker can be useful**need to change** 

## 1.  Introduction to containers

Containers have a long and storied history in computing. Unlike hypervisor virtualization, where one or more independent machines run virtually on physical hardware via an intermediate layrer, containers instead run in user space on top of an operating system's kernel. 

As a result container virtualization is often called operating-system level virtualization. Container technology allows multiple isolated user space instances to be run on a single host.

Since Containers have the status as guests of operating system, containers are sometimes seen as less flexible. They can generally only run the same or similar guest operating system as the underlying host.

Eg ( run RHEL on Ubuntu Server But not Windows on top of Ubuntu Server)

They are also seen as less secure than the full isolation of hypervisor virtualization. But countering this arugument is that lightweight containers lack the larger attak surface of full os needed by vm combined with the potential exposures of the hypervisor layer itself.

One of the common examples of a container is a chroot jail, which creates an isolated directory environment for running process. Attackers if they breach the running process in the jail, then find themselves trapped in this environment and unable to further compromise the host.

More Recent container technologies including OpenVZ , Solaris Zones and Linux Containers like Lxc / Lxd , made containers look like full-blown hosts rather than just execution environments. 

Similary Docker, is a container technology which uses modern linux kernel features ( like control groups, namespaces ) which makes strong isolation , their own network and storage stacks as well as resource management capabilities that will allow friendly co-existence of multiple containers on a host.

Containers are generally considered as a lean technology because the require limited overhead. Unlike virtualization/paravirtualization technologies , they do not require an emulation layer / hypervisor layer to run , and instead use the operating systems normal system call interface. This reduces the overhead required to run containers and can allow a greater density of containers to run on a host.

Containers are less adopted because they can be complex, hard to setup and difficult to manage and automate. Docker aims to change that.

# 2. Introduction to docker

* Docker is an open-source engine that automates the deployment of applications into containers.
* Written by Docker-Inc Team
* Released Under Apache 2.0 Licence
* Docker adds an application deployment engine on top of a virtualized container execution environment. 
* It is designed to provide a lightweight and fast environment to run your code as well as efficient workflow to get that code from your laptop to your test environment and then to production.
* Docker is simple and it requires a compatible linux kernel and a docker binary.

# 3. Docker Mission is to provide

* An easy and lightweight way to model reality

    * docker is fast. you can docerize your application in minutes.
    * docker relies on a copy on write model so that making changes to your app is incredibly fast. only what you want to change gets changed.
    * most docker containers take less than a second to launch ( compare hypervisor)
    * they make best possible use of resources.
    
* logical segregation of duties

    * With docker, developers care about their applications running inside containers.
    * Opearation care about managing the containers.
    * Dockers are designed to enhance consistency by ensuring the environment in which your developers write code matches the environment into which it is deployed.( reduces the risk of "worked in dev, now an ops problem")

* Fast, efficient development life cycle

    * Reduce the time between the code being written and code being deployed.
    * Makes your application portable,easy to build and easy to collaborate on.

* Encourages service oriented Architecture

    * Docker recommends that each container run a single app or process.
    * This promotes a distributed application model where an app or service is represented by a series of inter -connected containers.
    * Will make it easy to distribute,scale,debug and introspect your applications.

# 4. Docker Components

* Docker client and server ( Docker engine).

    * Docker is a client server application
    * Docker client talks to the Docker daemon or server, which in turn does all the work.
    * Docker Daemon also called Docker Engine
    * Docker has both a commandline client binary as well as Restful Api to interact with daemon.(dockerd)
    * Docker Architecture Image
* Docker Images.

	* Basic building blocks of Docker World
	* Containers are launched from docker images
	* Images are build as a part of Docker's lifecycle
	* they have a layered format,using Union filesystems that are built step by step using a series of instructions like add a file, run a command, open a port etc
	* source code of your container
	* portables, can be shared, stored and updated.
	* you can use existing images and even build your own images.
	
* Registries.
	* Docker stores the images that you build in registries.
	* Two types of registries ( Public and Private)
	* Docker.inc act as public registry called DockerHub. You can create your own account ( git from github)
	* you can also keep your images private in DockerHub 
	* you can also run yourown private registry other than DockerHub.

* Docker Containers.
	* docker helps you to build and deploy containers inside of which you can package your application and services.
	* They can contain one or more running processes.
	* Think Containers as running instances of images as process is the running instance of a program.
	* A container has an image format, a set of standared operations and an execution environment.
	* Like normal shipping container ( which ships goods ) Docker container ships software.

* Docker compose and Swarms
    * We can also run docker containers in stacks (compose) and in clusters ( swarms)
    * Docker ecosystme has two more tools to support these functionalitites
        * docker compose
        * docker swarm
    * stack ( application as a composite container of a webserver container,application server container , and database server container )
    * swarm as clusters of containers for running scalable workloads

* Docker with Configuration Management Tools
    * concept of `golden image` model having less flexibility
    * resulted in the need for conf. management tools
    * The management tools need to manage both the host and docker containers itself. 
    * eg creating a vm,installing docker inside it, creating a docker image, running and manging dockers,managing vm etc using a configuration management tool like puppet,chef,ansible etc

    * docker can run on any x64 host running linux kernel preferably 3.10 or above

## installing Docker in Debian Stretch

* Install the dependencies

    `apt-get install apt-transport-https ca-certificates  curl gnupg2 software-properties-common`
* Add docker gnupg key 
   `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -` 
* Update the sources.list
  `deb [arch=amd64] https://download.docker.com/linux/debian stretch stable`
* apt update and install docker-ce
    * `apt-get update`
    * ` apt-get install docker-ce`
* Add normal user to docker group, so that they can run docker

    * `adduser jithin docker`
    * reboot ( to apply changes)
    * groups ( issue when standing as normal user)
    * sudo service docker status/start/stop/restart 
## Docker Daemon

* docker daemon ( dockerd ) listens on unix sock at /var/run/docker.sock
* this socket is under  `docker` group . So user with docker group can run docker without using sudo
* docker ( client ) 
* configuring Docker Daemon
    * configuring its binding 
        * using -H parameter
        * eg `sudo dockerd -H unix:///home/docker.sock tcp://0.0.0.0:2375 
    * client needs to use these sockets to communicate with daemon
        * docker -H :2375 <everytime using client or>
        * export DOCKER_HOST="tcp://0.0.0.0:2375"
    * By default client server docker communication is not authenticated.
        * TLS authentication available and you need to enable it manually if you need
        * use options like HTTP_PROXY , HTTPS_PROXY,NO_PROXY if you are behind a firewall like UFW ( uncomplicated firewall...disabled in ubuntu/debian by default)

* Docker User Interfaces
    * you can use various docker user interfaces for managing dockers if needed.
    * eg include shipyard,portainer,kitematic <osx,windows>

## extra things to note

* vagrant can use docker as a provider ( similar to virtualbox,libvirt etc)
* we can use ansible with docker or through vagrant to docker
* **need to combine these technologies**

	
