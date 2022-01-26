//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;


contract BigBankO {

    mapping(address => uint256) public accounts;


    modifier hasFunds(uint256 _amount) {
        require(_amount <= accounts[msg.sender], "Does not have sufficient funds in the account bruh!.");
        _;
    }

    function deposit() public payable {
        accounts[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public hasFunds(_amount) {
        payable(msg.sender).transfer(_amount);
    }

    function checkAssets() public view returns(uint256) {
        return address(this).balance;
    }
}