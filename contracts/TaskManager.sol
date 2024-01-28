// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "https://github.com/mdexSwap/contracts/blob/master/contracts/library/SafeMath.sol";

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
    mapping(address => bool) premiums;
    event NewTask(Task task, uint time);


    constructor(){
        admin = msg.sender; // access the author of the smart contract
        count = 0;
    }

    function addTask(string memory content) public {
        Task memory task = Task(count, Priority.LOW, content, block.timestamp, false);
        tasks[count] = task;
        count = SafeMath.add(count, 1);
        emit NewTask(task, block.timestamp);
    }

    function completeTask(uint _count) public {
        Task memory task = tasks[_count];
        task.completed = true;
        tasks[_count] = task;
    }

    function upgradePlan() public payable {
        require(msg.value >= 5 wei, 'no sufficient fund');
        premiums[msg.sender] = true;
    }

    
}