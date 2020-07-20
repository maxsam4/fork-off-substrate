# Fork off substrate

This script allows bootstrapping a new substrate chain with the current state of a live chain. Using this, you can create a fork of Polkadot, Kusama and other substrate chain for development purposes.

## Usage

1. Clone this repository and install dependencies

    ```bash
    git clone https://github.com/maxsam4/fork-off-substrate.git
    cd fork-off-substrate
    npm i
    ```

2. Create a folder called `data` inside the top folder (`fork-off-substrate`).

    ```bash
    mkdir data
    ```

3. Copy the executable/binary of your substrate node inside the data folder and rename it to `binary`.

4. Copy the runtime WASM blob of your substrate chain inside the data folder and rename it to `runtime.wasm`. To get the WASM blob, compile your substrate chain and look for `./target/release/wbuild/runtime/runtime.compact.wasm`. If you are forking Polkadot/Kusama/Westend, you can download the WASM blobs from [Polkadot's release page](https://github.com/paritytech/polkadot/releases).

5. If your substrate chain uses additional custom types than what are available in polkadot.js, define them in a JSON file of format `{ "types": "{ <YOUR_TYPES> }" }`. Copy the file to the `data` folder and rename it to `schema.json`.

6. Either run a full node for your blockchain locally(Recommended) or have an eternal endpoint handy.

7. Run the script
    * If using a local node, simply run the script using

        ```bash
        npm start
        ```

    * If you are using an external/non-default endpoint, you need to provide it to the script via the `HTTP_RPC_ENDPOINT` environment variable

        ```bash
        HTTP_RPC_ENDPOINT=https://example.com npm start
        ```

8. You should have the genesis file for the forked chain inside the `data` folder. It will be called `fork.json`.

9. You can now run a new chain using this genesis file

    ```bash
    ./binary --chain fork.json --alice
    ```

## Read more

If you would like to understand how this script works, please read this [blog post](https://mudit.blog/fork-substrate-blockchain/)


## Credits

This script is based on [a script shared in the substrate riot channel](https://hackmd.io/mGgNZX0VT4S0UTaq89-_SQ)
