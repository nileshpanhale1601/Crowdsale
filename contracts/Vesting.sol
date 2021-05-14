pragma solidity ^0.8.0;

contract Vest {
    function vesting(uint256 _totalTotal, uint256 _share)
        private
        pure
        returns (uint256 _result)
    {
        uint256 result = (_totalTotal * _share) / 100;
        return (result);
    }
}
