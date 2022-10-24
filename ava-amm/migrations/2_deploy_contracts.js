const AMMContract = artifacts.require("AMM");

module.exports = function(deployer) {
    deployer.deploy(AMMContract);
}
