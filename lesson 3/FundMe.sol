// SPDX-License-Identifier: MIT

pragma solidity >=0.6.6 <0.9.0;

contract FundMe{

    // saves the address of the person who sent the money and the amount of money they sent
    mapping(address => uint256) public transactions;

    // function to send money to the contract
    function fund() public payable{
           transactions[msg.sender] += msg.value;
    }

}