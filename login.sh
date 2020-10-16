#!/bin/bash

export TZ=America/Sao_Paulo
echo $(date +"%d-%m-%Y_%H:%M:%S")
gcloud auth login --quiet
