#!/usr/bin/env bash

apt update && apt upgrade && apt install default-jdk htop ssh rsync python git scala

# Add new Hadoop group and user
adduser hadoop
