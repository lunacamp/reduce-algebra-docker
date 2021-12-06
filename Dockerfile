FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get -qq update && apt-get -y --no-install-recommends install gnuplot-x11 libxft2

RUN useradd -ms /bin/bash reduce
WORKDIR /home/reduce

ADD https://sourceforge.net/projects/reduce-algebra/files/snapshot_2021-10-19/linux64/reduce-complete_6110_amd64.deb/download reduce-complete_amd64.deb

RUN dpkg -i reduce-complete_amd64.deb

ENTRYPOINT [ "redcsl --nogui" ]
