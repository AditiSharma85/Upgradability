// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

/**
 * @dev Renamed version 1 to MySmartContractV1 to quickly workaround Truffle's singleton feature when deploying contracts.
 * This allows us to have both contract versions deployed at the same time.
 */
contract MySmartContractV1 {
    bool private isActive = true;
    uint32 public counter;
    address private owner;

    /**
    @dev Enforces the caller to be the contract's owner.
    */
    modifier isOwner {
        require(msg.sender == owner, "Sender is not owner.");
        _;
    }
     /**
    @dev Enforces the contract to be active.
    */
    modifier isNotStopped {
        require(isActive == true, "Contract is stopped.");
        _;
    }

    constructor() public {
        counter = 0;
        // Sets the contract's owner as the address that deployed the contract.
        owner = msg.sender;
    }

    function toggleContractStopped() public isOwner {
        // You can add an additional modifier that restricts stopping a contract to be based on another action, such as a vote of users
        isActive = !isActive;
    }

    /**
    @notice Increments the contract's counter if contract is active.
    @dev It should revert if the contract is stopped. Create a modifier named "isNotStopped"
    */
    function incrementCounter() public isNotStopped {
         counter += 2; // This is an intentional bug.
    }
}
