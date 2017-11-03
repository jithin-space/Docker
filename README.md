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
    * Docker Images.
    * Registries.
    * Docker Containers.
