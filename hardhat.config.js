require('@nomiclabs/hardhat-waffle');
require('dotenv').config();

module.exports = {
  solidity: '0.8.20',
  networks: {
    sepolia: {
      url: process.env.ALCHEMY_RPC_URL,
      accounts: [process.env.TESTNET_PRIVATE_KEY],
    },
  },
};
