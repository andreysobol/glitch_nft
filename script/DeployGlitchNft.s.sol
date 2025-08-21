// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {GlitchNft} from "../src/GlitchNft.sol";
import {console} from "forge-std/console.sol";

// export PRIVATE_KEY=0x
// forge script script/DeployGlitchNft.s.sol:DeployGlitchNft --rpc-url http://localhost:8545 --broadcast

contract DeployGlitchNft is Script {
    function run() external returns (GlitchNft) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Base metadata URI for the collection
        string memory baseMetadataURI = "ipfs://QmQ2AV3ESMPuq6wJtvu6yei9ZAHwYoMguamyVuDoLyy15q/";

        vm.startBroadcast(deployerPrivateKey);

        GlitchNft glitchNft = new GlitchNft(baseMetadataURI);

        vm.stopBroadcast();

        console.log("=== GlitchNft Deployment ===");
        console.log("Contract deployed at:", address(glitchNft));
        console.log("Base Metadata URI:", baseMetadataURI);
        console.log("Max Supply: 16 tokens (0-15)");
        console.log("Minting: Public (anyone can mint)");
        console.log("Network:", block.chainid);
        console.log("Deployer:", vm.addr(deployerPrivateKey));
        console.log("=============================");

        return glitchNft;
    }
}
