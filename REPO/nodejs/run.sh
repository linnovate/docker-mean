#documentation:
#https://docs.docker.com/examples/nodejs_web_app/


name='docker-node-hello-cube'



commander git clone https://github.com/cwarden/$name.git
commander cd $name
commander  sudo docker build .
commander  sudo docker build -t $LOGNAME/$name .
commander sudo docker images
commander sudo docker run $LOGNAME/$name
