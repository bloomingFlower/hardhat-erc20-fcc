// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/presets/ERC20PresetMinterPauser.sol";

contract OurToken is ERC20PresetMinterPauser {
    bytes32 public constant BURNER_ROLE = keccak256("BURNER_ROLE");

    constructor(uint256 initialSupply) ERC20PresetMinterPauser("BVTTEST", "BVTTT") {
        _mint(msg.sender, initialSupply);
        grantRole(BURNER_ROLE, msg.sender);
    }

    function burn(uint256 value) public override onlyRole(BURNER_ROLE) {
        super._burn(msg.sender, value);
    }

    // REJECT any incoming ether
    // fallback() external payable {
    //     revert();
    // }
}
