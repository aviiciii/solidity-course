// SPDX-License-Identifier: MIT

pragma solidity >=0.6.6 <0.9.0;

// Eth to usd convertor
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";


contract FundMe{

    // saves the address of the person who sent the money and the amount of money they sent
    mapping(address => uint256) public transactions;

    // function to send money to the contract
    function fund() public payable{
           transactions[msg.sender] += msg.value;
    }

    function get_version() public view returns(uint256){
        // get eth/usd address for goerli from: https://docs.chain.link/data-feeds/price-feeds/addresses
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);
        return pricefeed.version();
    }

}