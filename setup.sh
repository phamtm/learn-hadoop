#!/usr/bin/env bash

apt update && apt upgrade && apt install default-jdk htop

# Add new Hadoop group and user
adduser hadoop
groupadd hadoop
usermod -g hadoop hadoop
