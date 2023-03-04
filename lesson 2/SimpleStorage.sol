// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage{
    
    // intialise
    uint256 favoriteNumber;

    // create struct 
    struct People{
        uint256 favoriteNumber;
        string name;
    }

    // initialise dynamic array of struct people
    People[] public people;

    // mapping name to fav number
    mapping(string => uint256) public nameToFavoriteNumber;

    // add people to array
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // add to array
        people.push(People(_favoriteNumber, _name));

        // add to mapping
        nameToFavoriteNumber[_name] = _favoriteNumber;

    }


    // store function
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view function
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    
}