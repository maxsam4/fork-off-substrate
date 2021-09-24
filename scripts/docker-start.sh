#!/usr/bin/env bash

# Fetch the wasm from the node
subwasm --version
subwasm get $HTTP_RPC_ENDPOINT -o /data/runtime.wasm

# start fork-off-substrate
npm start
