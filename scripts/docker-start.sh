#!/usr/bin/env bash
set -e

BINARY=data/binary
$BINARY --version

echo Will connect to $HTTP_RPC_ENDPOINT

# Fetch the wasm from the node
subwasm --version
subwasm get $HTTP_RPC_ENDPOINT -o data/runtime.wasm
subwasm info data/runtime.wasm

# start fork-off-substrate
npm start

# Run new chain
./binary --chain fork.json --alice
