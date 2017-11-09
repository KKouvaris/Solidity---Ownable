pragma solidity ^0.4.4;

/** @title Ownership Contract */
contract Ownable {

    // keeps the address of the account that created the contract
    address internal owner;

    /** @dev Constructor: instantiates onwership for derived contracts */
    function Ownable() public { owner = msg.sender; }

}