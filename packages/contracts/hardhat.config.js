require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config()
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks:{
    amoy: {
      url: process.env.AMOY,
      accounts:[process.env.PRIVATE_KEY]
    }
  }
};
