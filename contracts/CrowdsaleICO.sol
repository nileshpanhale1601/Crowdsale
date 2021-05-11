pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/smartcontractkit/chainlink/blob/master/evm-contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract Whitelisted {
    mapping(address => bool) public whitelist;

    modifier isWhitelisted(address _investor) {
        require(whitelist[_investor]);
        _;
    }

    function add(address _investor) internal {
        whitelist[_investor] = true;
    }

    function addMultiple(address[] memory _investors) external {
        for (uint256 i = 0; i < _investors.length; i++) {
            whitelist[_investors[i]];
        }
    }

    function remove(address _investor) external {
        whitelist[_investor] = false;
    }
}

contract USDconverter {
    AggregatorV3Interface internal priceFeed;

    /**
     * Network: Rinkeby
     * Aggregator: ETH/USD
     * Address: 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
     */
    constructor() public {
        priceFeed = AggregatorV3Interface(
            0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
        );
    }

    /**
     * Returns the latest price
     */
    function getThePrice() internal view returns (int256) {
        (
            uint80 roundID,
            int256 price,
            uint256 startedAt,
            uint256 timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
    }
}

contract QuillHashToken is ERC20, Whitelisted, USDconverter {
    string _name = "XToken";
    string _symbol = "XT";
    uint256 totalToken = 50000000000;
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

    modifier isOwner {
        require(msg.sender == owner);
        _;
    }

    function addInvestor(address _investor) public isOwner {
        add(_investor);
    }

    function getPrice() public {
        int256 price = getThePrice();
    }
}
