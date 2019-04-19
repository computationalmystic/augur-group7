#! /usr/bin/env vagrant

nohup vagrant up >>vagrant.log & 

nohup vagrant rsync-auto >>rsync-auto.log &

