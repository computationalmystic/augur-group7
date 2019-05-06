#! /usr/bin/env vagrant

nohup vagrant resume augur >>vagrant.log & 

nohup vagrant rsync-auto >>rsync-auto.log &

