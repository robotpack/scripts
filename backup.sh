#!/bin/bash

sudo zip -r /backup.zip /root/* -x *.log
sudo zip -r /.backup.zip /root/.* -x *.log
clear
