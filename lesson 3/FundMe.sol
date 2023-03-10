// SPDX-License-Identifier: MIT

pragma solidity >=0.6.6 <0.9.0;

// Eth to usd convertor
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";



contract FundMe{


    address public owner;

    constructor() public {
        owner = msg.sender;
    }

    // saves the address of the person who sent the money and the amount of money they sent
    mapping(address => uint256) public transactions;

    // function to send money to the contract
    function fund() public payable{
        // crete minimum of $10 for transaction in wei 
        uint256 minimum_amount = 10 * (10 ** 18);
        
        // check minimum
        require (get_conversion_rate(msg.value) >= minimum_amount, "Minimum amount is $10 buddy!");

        // add log of transactions
        transactions[msg.sender] += msg.value;
    }

    function withdraw() public payable{
        require(msg.sender == owner);
        msg.sender.transfer(address(this).balance);
    }

    function get_version() public view returns(uint256){
        // get eth/usd address for goerli from: https://docs.chain.link/data-feeds/price-feeds/addresses
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return pricefeed.version();
    }

    function get_price() public view returns(uint256){
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        
        // get price 
        (, int256 answer, , , ) = pricefeed.latestRoundData();

        // return 18 digit price
        return uint256(answer * 10000000000);
    }

    // for wei
    function get_conversion_rate(uint256 eth_amt) public view returns(uint256){
        uint256 eth_price = get_price();
        uint usd_amt = (eth_amt * eth_price) / 1000000000000000000;
        return usd_amt;
    }
    // .000001568396100000
}