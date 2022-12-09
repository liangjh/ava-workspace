pragma solidity ^0.8.0

import "truffle/Assert.sol";
import "../contracts/Election.sol";

contract TestElection {

    function testConstructor() public {
        string[] memory nda = new string[](2);
        nda[0] = "US Election";
        nda[1] = "US presidential election";

        string[] memory candidates = new string[](2);
        candidates[0] = "Satoshi";
        candidates[1] = "Musk";

        Election election = new Election(nda, candidates);

        uint256 firstCandidateId;
        string memory firstCandidateName;
        uint256 firstCandidateVoteCount;

        uint256 secondCandidateId;
        string memory secondCandidateName;
        uint256 secondCandidateVoteCount;

        (firstCandidateId, firstCandidateName, firstCandidateVoteCount) = election.candidates(0);
        (secondCandidateId, secondCandidateName, secondCandidateVoteCount) = election.candidates(1);

        Assert.equal(firstCandidateId, 0, "Candidate id should be '0'");
        Assert.equal(firstCandidateName, "Satoshi", "Candidate name should be 'Satoshi'");
        Assert.equal(firstCandidateVoteCount, 0, "Candidate voteCount should be '0'");
        Assert.equal(secondCandidateId, 1, "Candidate id should be '1'");
        Assert.equal(secondCandidateName, "Musk", "Candidate name should be 'Musk'");
        Assert.equal(secondCandidateVoteCount, 0, "Candidate voteCount should be '0'");
        Assert.equal(election.candidatesCount(), 2, "Candidate count be 2");
    }

    function testVoteFailIfVoted() public {
        string[] memory nda = new string[](2);
        nda[0] = "US Election";
        nda[1] = "US presidential election";

        string[] memory candidates = new string[](2);
        candidates[0] = "Satoshi";
        candidates[1] = "Musk";

        Election election = new Election(nda, candidates);
        election.vote(0);

        (, , uint256 voteCount) = election.candidates(0);

        Assert.equal(voteCount, 1, "'voteCount' should be 1");
        Assert.isTrue(election.voters(address(this)), "Should be true");

        bytes4 selector = election.vote.selector;
        bytes memory data = abi.encodeWithSelector(selector, uint256(0));

        (bool success, ) = address(election).call(data);

        Assert.isFalse(success, "Should be false");
    }

}


