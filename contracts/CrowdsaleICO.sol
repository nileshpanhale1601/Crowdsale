pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract QuillHashToken is ERC20 {
    string _name = "XToken";
    string _symbol = "XT";
    uint256 totalToken = 50000000000;
    address owner;

    constructor() public ERC20(_name, _symbol) {
        owner = msg.sender;
        _mint(owner, totalToken);
    }
}
