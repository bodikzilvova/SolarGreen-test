// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SolarGreen is ERC20, Ownable {
    mapping(address => bool) private _blacklist;

    constructor(uint256 initialSupply, address initialOwner)
        ERC20("Solar Green", "SGR")
        Ownable(initialOwner)
    {
        _mint(msg.sender, initialSupply);
    }

    function addToBlacklist(address account) external onlyOwner {
        _blacklist[account] = true;
    }

    function removeFromBlacklist(address account) external onlyOwner {
        _blacklist[account] = false;
    }

    function mint(address account, uint256 amount) external onlyOwner {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) external onlyOwner {
        _burn(account, amount);
    }

    function transfer(address recipient, uint256 amount)
        public
        override
        returns (bool)
    {
        require(!_blacklist[msg.sender], "Sender is blacklisted!");
        require(!_blacklist[recipient], "Recipient is blacklisted!");
        return super.transfer(recipient, amount);
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) public override returns (bool) {
        require(!_blacklist[sender], "Sender is blacklisted!");
        require(!_blacklist[recipient], "Recipient is blacklisted!");
        return super.transferFrom(sender, recipient, amount);
    }
}