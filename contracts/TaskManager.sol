// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract TaskManager {

     enum Priority { LOW, MEDIUM, HIGH }
     struct Task {
        uint id;
        Priority priority;
        string content;
        uint timestamp;
        bool completed;
    }
}