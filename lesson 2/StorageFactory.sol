// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "./SimpleStorage.sol";

contract StorageFactory{

    // array to store addresses of the storages created
    SimpleStorage[] public storage_array;


    function create_storage() public {
        // create new storage and save address to the array
        SimpleStorage new_storage = new SimpleStorage();
        storage_array.push(new_storage);
    }

    

}