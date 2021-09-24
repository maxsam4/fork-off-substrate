FROM sitespeedio/node:ubuntu-20.04-nodejs-14.17.6

ARG SUBWASM_VERSION=0.14.1
COPY . .

RUN apt-get update && apt-get upgrade -yq
RUN apt-get install -y  wget bsdmainutils \
    && apt-get -y autoclean

RUN wget https://github.com/chevdor/subwasm/releases/download/v${SUBWASM_VERSION}/subwasm_linux_amd64_v${SUBWASM_VERSION}.deb -O subwasm.deb && \
    dpkg -i subwasm.deb && \
    subwasm --version

RUN npm install

ENV HTTP_RPC_ENDPOINT=http://localhost::9933
ENV FORK_CHUNKS_LEVEL=1
ENV QUICK_MODE=false

VOLUME [ "/data" ]

ENTRYPOINT [ "./scripts/docker-start.sh" ]
