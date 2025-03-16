## Docker Images

A bunch of Docker images I use for my projects. 

- `ubuntu-minimal`: A minimal image based in `ubuntu:latest`. Installs some compilers, Python, BLAS, LAPACK, Eigen, Boost and some build tools.

- `ubuntu-dev`: An advanced development image based in `ubuntu-latest`. Installs advanced tools including Intel OneAPI. 

#### Building
Use the `build.sh` script to build the images. For example:
```bash
./build.sh ubuntu-minimal
```
See the script for more details.