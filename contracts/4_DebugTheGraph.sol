// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "hardhat/console.sol";

contract DeubgTheGraph {
    event ABC(uint256 abc);

    // 跟踪用户余额
    mapping (address => uint256) public balances;

    function buy() public {
        emit ABC(block.timestamp);
    }


    function stake() payable public  {
        console.log("msg.sender",msg.sender);
        console.log("msg.value",msg.value);
        balances[msg.sender] += msg.value;
    }


      // 获取合约账户余额 
    function getBalanceOfContract() public view returns (uint256) {
        console.log("address(this)",address(this));
        return address(this).balance;
    }

    modifier validAll() {
        console.log("11111111111");
        _;
    }

    modifier validAfter() {
        _;
        console.log("22222222222");
    }

    function withdraw() public payable {
        // uint256 _amount = balances[msg.sender];
        // require(_amount > 0,"-----------------No refundable balance");
        // balances[msg.sender] = 0;
        payable(msg.sender).transfer(msg.value);
    }





    
    fallback() external payable {}
    
    receive() external payable {}
}