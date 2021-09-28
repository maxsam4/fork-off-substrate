FROM ubuntu:20.04

ARG SUBWASM_VERSION=0.14.1

RUN apt-get update && apt-get upgrade -yq
RUN apt-get install -y  wget curl bsdmainutils iputils-ping && \
    apt-get -y autoclean

RUN wget https://github.com/chevdor/subwasm/releases/download/v${SUBWASM_VERSION}/subwasm_linux_amd64_v${SUBWASM_VERSION}.deb -O subwasm.deb && \
    dpkg -i subwasm.deb && \
    subwasm --version && \
    rm subwasm.deb

RUN curl -sL https://deb.nodesource.com/setup_16.x | bash
RUN apt install nodejs && npm install -g npm
RUN node -v; npm -v;

RUN useradd -m -u 1000 -U -s /bin/sh forker && \
    mkdir -p /data && \
    chown -R forker:forker /data

COPY . .
RUN npm install

# USER forker

ENV HTTP_RPC_ENDPOINT=http://localhost::9933
ENV FORK_CHUNKS_LEVEL=1
ENV QUICK_MODE=false

VOLUME [ "/data" ]

ENTRYPOINT [ "./scripts/docker-start.sh" ]
