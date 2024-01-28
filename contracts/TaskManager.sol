// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract TaskManager {

     enum Priority { LOW, MEDIUM, HIGH } 

     struct Task {
        uint id; // Task ID
        Priority priority; // Task Priority
        string content; // Task content
        uint timestamp; // Task creation time
        bool completed; // Task completed or not state
    }

    address admin; // the author of spart contract
    uint private count;

    mapping(uint => Task) tasks; 
    

    constructor(){
        admin = msg.sender; // access the author of the smart contract
        count = 0;
    }

    
}