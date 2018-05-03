# docker-llvm-3.8
A docker image for llvm 3.8

Usage:
1. Building the Docker image locally

   $ git clone https://github.com/HGuo15/docker-llvm-3.8.git
   $ cd docker-llvm-3.8
   $ docker build -t llvm-3.8-image .  
   
2. Creating a LLVM Docker container and name it 'llvm-3.8-container'
   $ docker run -ti --name=llvm-3.8-container --ulimit='stack=-1:-1' llvm-3.8-image
   
   and restart the container with,
   $ docker start -ai llvm-3.8-container
