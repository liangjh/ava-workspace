const DevToken = artifacts.require("DevToken");
const AvaSwap = artifacts.require("AvaSwap");

module.exports = async function(deployer) {

    deployer.deploy(DevToken).then(function() {
        return deployer.deploy(AvaSwap, DevToken.address)
    })

    // const devToken = await deployer.deploy(DevToken).deployed();
    // const avaSwap = await deployer.deploy(AvaSwap, devToken.address).deployed();
    // await devToken.transfer(avaSwap.address, '1000000000000000000000000');

}
