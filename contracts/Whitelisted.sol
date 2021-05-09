pragma solidity ^0.8.0;

contract Whitelisted {
    mapping(address => bool) public whitelist;

    modifier isWhitelisted(address _investor) {
        require(whitelist[_investor]);
        _;
    }

    function add(address _investor) external {
        whitelist[_investor] = true;
    }

    function addMultiple(address[] memory _investors) external {
        for (uint256 i = 0; i < _investors.length; i++) {
            whitelist[_investors[i]];
        }
    }
}
