# smart-contract-workspace
Smart contracts / crypto scratch code / workspace on various networks:  
- Avalanche
- Polygon
- Solana
- Aptos

Creating NPM Environment
```shell
	npm init
	npm install -g truffle
	npx truffle init # will create general solidity dir structure
	npx truffle test
	npm install @openzeppelin/contracts
	npm install @truffle/hdwallet-provider
```

Set up local blockchain (ganache, via truffle)
```shell
	npm install ganache --global
	ganache # will run service
```

Compiling solidity code
```shell
  npx truffle compile # creates .json files in build/
```

Deploy to development / Deploy to testnet (fuji) (Avalanche-specific)
```shell
	npx truffle migrate --network development
	npx truffle migrate --network fuji 
	// note these networks are config'd in truffle-config.js
```  

Viewing contract deployed on testnet (Avalanche-specific):
	https://testnet.snowtrace.io

Fuji Testnet info & Faucet (Avalanche-specific): 
	https://umbria.network/connect/avalanche-fuji-testnet
	https://faucet.avax.network/
  


