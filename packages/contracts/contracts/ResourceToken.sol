// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ResourceToken is ERC20, Ownable {
    uint256 public constant TOTAL_SUPPLY = 10000 * 10**18;
    uint256 public pointsPerToken = 10; // Number of points required to earn 1 token

    mapping(address => uint256) public userPoints;
    mapping(address => uint256) public userTokens;

    event PointsUpdated(address indexed user, uint256 points);
    event TokensAwarded(address indexed user, uint256 tokens);

    constructor(address ownerAddress) ERC20("ResourceToken", "RTK") Ownable(ownerAddress) {
        _mint(address(this), TOTAL_SUPPLY); // Mint the total supply to the contract itself
    }

    function addPoints(address user, uint256 points) external onlyOwner {
        userPoints[user] += points;
        emit PointsUpdated(user, userPoints[user]);

        uint256 tokensToAward = points / pointsPerToken; // Calculate tokens based on points
        if (tokensToAward > 0) {
            _transfer(address(this), user, tokensToAward * 10**18);
            userTokens[user] += tokensToAward * 10**18;
            emit TokensAwarded(user, tokensToAward * 10**18);
        }
    }

    function getUserPoints(address user) external view returns (uint256) {
        return userPoints[user];
    }

    function getUserTokens(address user) external view returns (uint256) {
        return userTokens[user];
    }
}