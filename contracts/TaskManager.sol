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
    mapping(address => bool) public premiums;
    event NewTask(Task task, uint time);


    constructor(){
        admin = msg.sender; // access the author of the smart contract
        count = 0;
    }

    // Adding tasks with a limite of 10 if basic account, if premium account task adding option is limitless
    function addTask(string memory content) public isPemium {
        Task memory task = Task(count, Priority.LOW, content, block.timestamp, false);
        tasks[count] = task;
        count = SafeMath.add(count, 1);
        emit NewTask(task, block.timestamp);
    }

    // Making a task completed
    function completeTask(uint _count) public {
        Task memory task = tasks[_count];
        task.completed = true;
        tasks[_count] = task;
    }

    // Upgrading basic plan to premium for 5 wei
    function upgradePlan() public payable {
        require(msg.value >= 5 wei, 'no sufficient fund');
        premiums[msg.sender] = true;
    }

    // Modifier to check the plan
    modifier isPemium {
        require(count + 1 < 11 || premiums[msg.sender], 'please upgrade to add more than 10');
        _;
    }

    // Getting the count of created tasks for the selected account
    function getTasksCount() view public returns (uint) {
        return count;
    }

    
}