pragma solidity >=0.6.0;


import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "./DevToken.sol";


contract AvaSwap {
    string public name = "AvaSwap Network Exchange";
    DevToken public Token;
    uint public rate;
    AggregatorV3Interface internal priceFeed;    

    event TokenPurchase(
        address account,
        address token,
        uint amount,
        uint rate
    );

    event TokenSold(
        address account,
        address token,
        uint amount,
        uint rate
    );

    constructor(DevToken _Token) public {
        Token = _Token;
        priceFeed = AggregatorV3Interface(0x5498BB86BC934c8D34FDA08E81D444153d0D06aD);  // chainlink oracle
        rate = uint256(getLatestPrice());
    }

    function getLatestPrice() public view returns(int) {
        (
            uint80 roundID,
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();

        require(timeStamp > 0, "Round not complete");
        return 1e18 / price; // exchange rate
    }

    function buyTokens() public payable {
        // Calc # of tokens to buy; avax amount * redemption rate
        uint tokenAmount = msg.value * rate;
        Token.transfer(msg.sender, tokenAmount);
        emit TokenPurchase(msg.sender, address(Token), tokenAmount, rate);        
    }

    function sellToken(uint _amount) public {
        require(Token.balanceOf(msg.sender) >= _amount);  // can't sell more than you have
        // amount of avax to redeem; confirm that avaswap has enough avax
        uint avaxAmount = _amount / rate;
        require(address(this).balance >= avaxAmount);
        Token.transferFrom(msg.sender, address(this), _amount);
        msg.sender.transfer(avaxAmount);
        emit TokenSold(msg.sender, address(Token), _amount, rate);
    }



}

