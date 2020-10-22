#!/bin/bash

sudo zip -r /.backup.zip /root/* -x *.log
sudo zip -r /.config.zip /root/.config -x *.log
clear
