pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract TokenICO is ERC20 {
    address owner;

    constructor(string memory _name, string memory _symbol)
        public
        ERC20(_name, _symbol)
    {
        owner = msg.sender;
        _mint(owner, 50000000000);
    }
}
