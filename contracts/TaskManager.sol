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

    address admin;
    uint private count;

    constructor(){
        admin = msg.sender;
        count = 0;
    }

    
}