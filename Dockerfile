FROM debian:testing
WORKDIR /home/brian
COPY . .
RUN scripts/debian_setup.sh
