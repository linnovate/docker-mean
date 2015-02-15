 
[docker hub](https://registry.hub.docker.com/u/linnovate/docker-mean)

[![Circle CI](https://circleci.com/gh/linnovate/docker-mean.svg?style=svg)](https://circleci.com/gh/linnovate/docker-mean)


TODO:
----
- Expose the app-folder(myApp) as a docker-volume



RUN:
----
- start a **Mongo** dedicated machine
- start a **Mean** dedicated machine ( + link it to the Mongo machine)

```bash
docker run -v /data:/data -p 27017:27017 -p 28017:28017 -d --name mongo_deamon brownman/mongo sh -c 'mongod --rest --httpinterface --smallfiles'
docker run -p 3000:3000 -p 35729:35729  --link mongo_deamon:db -t liorkesos/docker-mean bash
```
