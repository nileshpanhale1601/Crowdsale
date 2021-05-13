pragma solidity ^0.8.0;

contract Vest {
    function Vesting(uint256 _totalSupply, uint256 _sharePercentage)
        external
        view
        returns (uint256 _share)
    {
        _share = (_totalSupply * _sharePercentage) / 100;
    }
}
