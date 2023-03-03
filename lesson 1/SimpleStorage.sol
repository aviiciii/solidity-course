

pragma solidity ^0.6.0;

contract SimpleStorage{
    
    // intialise
    uint256 favoriteNumber;


    // store function
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view function
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }

    //
    function add() public view returns(uint256){
        return favoriteNumber + favoriteNumber;
    }
}