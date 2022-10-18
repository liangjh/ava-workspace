const DevToken = artifacts.require("DevToken");
const AvaSwap = artifacts.require("AvaSwap");

module.exports = async function(deployer) {

    await deployer.deploy(DevToken);
    const devToken = await DevToken.deployed();

    await deployer.deploy(AvaSwap, devToken.address);
    const avaSwap = await AvaSwap.deployed()

    await devToken.transfer(avaSwap.address, '1000000000000000000000000');
}

