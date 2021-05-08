pragma solidity ^0.8.0;

contract Vesting {
    uint256 reserveWallet;
    uint256 interestPayWallet;
    uint256 teamHrWallet;
    uint256 genFundWallet;
    uint256 airDropWallet;
    uint256 tokenWallet;

    function vest(uint256 _totalTotal) public {
        reserveWallet = (_totalTotal * 30) / 100;
        interestPayWallet = (_totalTotal * 20) / 100;
        teamHrWallet = (_totalTotal * 10) / 100;
        genFundWallet = (_totalTotal * 13) / 100;
        airDropWallet = (_totalTotal * 2) / 100;
        tokenWallet = (_totalTotal * 25) / 100;
    }
}
