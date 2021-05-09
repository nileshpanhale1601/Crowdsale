pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract QuillHashToken is ERC20 {
    string _name = "XToken";
    string _symbol = "XT";
    uint256 totalToken = 50000000000;
    // uint tokenPrice = 0.001;
    address owner;

    uint256 public reserveWallet = 30;
    uint256 public interestPayWallet = 20;
    uint256 public teamHrWallet = 10;
    uint256 public genFundWallet = 13;
    uint256 public airDropWallet = 2;
    uint256 public tokenWallet = 25;

    constructor() public ERC20(_name, _symbol) {
        owner = msg.sender;
        _mint(owner, totalToken);
        reserveWallet = vesting(totalToken, reserveWallet);
        interestPayWallet = vesting(totalToken, interestPayWallet);
        teamHrWallet = vesting(totalToken, teamHrWallet);
        genFundWallet = vesting(totalToken, genFundWallet);
        airDropWallet = vesting(totalToken, airDropWallet);
        tokenWallet = vesting(totalToken, tokenWallet);
    }

    function vesting(uint256 _totalTotal, uint256 _share)
        private
        pure
        returns (uint256 _result)
    {
        uint256 result = (_totalTotal * _share) / 100;
        return (result);
    }
}
