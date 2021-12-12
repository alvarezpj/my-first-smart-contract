// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.22 < 0.9.0;

contract ApprovalContract {

    address public sender;
    address payable public receiver;
    address public constant approver = 0x9B0dC24433edB679fB71b3F5035584253131348F;

    function deposit(address payable _receiver) external payable {
        require(msg.value > 0);
        sender = msg.sender;
        receiver = _receiver;
    }

    function viewApprover() external pure returns(address) {
        return(approver);
    }

    function approve() external {
        require(msg.sender == approver);
        receiver.transfer(address(this).balance);
    }
}
