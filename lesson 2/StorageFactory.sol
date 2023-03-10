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

    function add_fav(uint256 array_index, uint256 favorite_number) public {
        // get the storage using address in the array
        SimpleStorage the_storage = SimpleStorage(address(storage_array[array_index]));

        // call the store function to save favourite number 
        the_storage.store(favorite_number); 

    }

    function show_fav(uint256 array_index) view public returns(uint256) {
        // get the storage using address in the array
        SimpleStorage the_storage = SimpleStorage(address(storage_array[array_index]));

        // call retrieve function to show fav num
        return the_storage.retrieve();
    }

}