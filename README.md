IndianCabinetMinisters Smart Contract
This smart contract is designed to manage a list of Indian cabinet ministers. It allows for the addition of ministers, updating their departments, deactivating ministers, and retrieving minister details. The contract ensures data integrity and proper function execution using Solidity's error-handling mechanisms (require(), assert(), and revert()).

Description
Project Description
The IndianCabinetMinisters smart contract is a decentralized application built on the Ethereum blockchain to manage the list of cabinet ministers in India. It allows an administrator to add new ministers, update their departments, deactivate inactive ministers, and retrieve minister details securely and transparently.

Key Features
Add Ministers: The contract owner can add new ministers with a name and department.
Retrieve Details: Anyone can view minister details by ID.
Update Department: The contract owner can update a minister's department.
Deactivate Ministers: The contract owner can mark ministers as inactive.
Error Handling: Ensures data integrity using require(), assert(), and revert().
This project promotes transparency and trust in government operations by securely managing minister information on the blockchain.

Getting Started
Installing
To download the code, you can visit the following file path:-(https://github.com/Sagarthakur18/ETH-AVAX_assesment_1/blob/main/ETH%2BAVAX_assesment_1.sol)

Executing program
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at (https://remix.ethereum.org/.)

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Meta.sol). Copy and paste the following code into the file: contract MyToken {

 // Function to add a new minister
    function addMinister(string memory _name, string memory _department) public onlyOwner {
        require(bytes(_name).length > 0, "Minister name must not be empty");
        require(bytes(_department).length > 0, "Minister department must not be empty");
        ministerCount++;
        ministers[ministerCount] = Minister(_name, _department, true);
    }

    // Function to get minister details
    function getMinister(uint _id) public view returns (string memory, string memory, bool) {
        require(_id > 0 && _id <= ministerCount, "Minister ID does not exist");
        Minister memory minister = ministers[_id];
        return (minister.name, minister.department, minister.isActive);
    }

    // Function to update minister portfolio
    function updateDepartment(uint _id, string memory _newDepartment) public onlyOwner {
        require(_id > 0 && _id <= ministerCount, "Minister ID does not exist");
        require(bytes(_newDepartment).length > 0, "New portfolio must not be empty");
        ministers[_id].department = _newDepartment;
    }

    // Function to deactivate a minister
    function deactivateMinister(uint _id) public onlyOwner {
        require(_id > 0 && _id <= ministerCount, "Minister ID does not exist");
        ministers[_id].isActive = false;
    }

    // Function using assert to check a condition
    function testAssert(uint _id) public view {
        Minister memory minister = ministers[_id];
        // Using assert to ensure the minister's name is always not empty
        assert(bytes(minister.name).length > 0);
    }

    // Function using require to check a condition
    function testRequire(uint _id) public view {
        // Using require to ensure the minister ID exists
        require(_id > 0 && _id <= ministerCount, "Minister ID does not exist");
    }

    // Function using revert to check a condition
    function testRevert(uint _id) public view {
        // Using revert to check if the minister ID does not exist
        if (_id == 0 || _id > ministerCount) {
            revert("Minister ID does not exist");
        }
    }
}

Authors
Sagar Thakur (sagarthakur8456@gmail.com)

License
This project is licensed under the MIT License - see the LICENSE.md file for details
