const electionsContract = artifacts.require("Election");

module.exports = function(deployer) {
    deployer.deploy(electionsContract);
}
