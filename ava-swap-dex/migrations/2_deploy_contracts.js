const AvaSwap = artifacts.require("AvaSwap");
const DevToken = artifacts.require("DevToken");

module.exports = function(deployer) {

    await deployer.deploy(DevToken, "5777");
    const devToken = await DevToken.deployed();

    await deployer.deploy(AvaSwap, devToken.address);
    const avaSwap = await AvaSwap.deployed()

    await devToken.transfer(avaSwap.address, '1000000000000000000000000');
}

