const hre = require('hardhat')

async function main(){
    const adder = await hre.ethers.deployContract
    ("ResourceToken", ["0xCb4d53978E9B7b56f2f72eca552e333f891D59C6"]);
    await adder.waitForDeployment();

        console.log("Adder deployed to:",adder.target);
    }
    main().catch((error) => {
        console.error(error);
        process.exitCode = 1;
    });
    

