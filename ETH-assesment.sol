// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract IndianStates {
    struct State {
        string name;
        string governor;
        bool isActive;
    }

    mapping(uint => State) private states; // Mapping of state IDs to State structs
    uint public stateCount; // Counter for state IDs
    address public owner; // Owner of the contract (admin)

    // Set the deployer of the contract as the owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict actions to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    // Function to add a new state
    function addState(string memory _name, string memory _governor) public onlyOwner {
        require(bytes(_name).length > 0, "State name must not be empty");
        require(bytes(_governor).length > 0, "Governor name must not be empty");
        stateCount++;
        states[stateCount] = State(_name, _governor, true);
    }

    // Function to get state details
    function getState(uint _id) public view returns (string memory, string memory, bool) {
        require(_id > 0 && _id <= stateCount, "State ID does not exist");
        State memory state = states[_id];
        return (state.name, state.governor, state.isActive);
    }

    // Function to update state governor
    function updateGovernor(uint _id, string memory _newGovernor) public onlyOwner {
        require(_id > 0 && _id <= stateCount, "State ID does not exist");
        require(bytes(_newGovernor).length > 0, "New governor name must not be empty");
        states[_id].governor = _newGovernor;
    }

    // Function to deactivate a state
    function deactivateState(uint _id) public onlyOwner {
        require(_id > 0 && _id <= stateCount, "State ID does not exist");
        states[_id].isActive = false;
    }

    // Function using assert to check a condition
    function testAssert(uint _id) public view {
        require(_id > 0 && _id <= stateCount, "State ID does not exist");
        State memory state = states[_id];
        // Using assert to ensure the state's name is always not empty
        assert(bytes(state.name).length > 0);
    }

    // Function using require to check a condition
    function testRequire(uint _id) public view {
        // Using require to ensure the state ID exists
        require(_id > 0 && _id <= stateCount, "State ID does not exist");
    }

    // Function using revert to check a condition
    function testRevert(uint _id) public view {
        // Using revert to check if the state ID does not exist
        if (_id == 0 || _id > stateCount) {
            revert("State ID does not exist");
        }
    }
}
