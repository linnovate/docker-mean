docker-mean
===========

Runs MEAN Stack inside Docker

building
========

cd docker-mean
docker build -t yourusername/docker-mean .


running
=======

docker run -p 1022:22 -p 80:3000 -d  yourusername/docker-mean


remarks
=======

sshd can be removed if not needed
