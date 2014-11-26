#!/bin/bash
source config.cfg

cd MACHINE/$machine_name
sudo docker build .
