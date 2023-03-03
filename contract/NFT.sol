// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract LaborTokenDemo is ERC721 {
    using Strings for uint256;

    string private extensionMeta = ".json";

    constructor() ERC721("Labor Token Demo", "LTD") {
        uint8 preMint = 5;

        for (uint8 i = 1; i <= preMint; i++) {
            _safeMint(msg.sender, i);
        }
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmabtrEsmG9dTRMqbVQGPAdX8nMU1EcginS4jn7dsLmSMP/";
    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        _requireMinted(tokenId);

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0
            ? string(abi.encodePacked(baseURI, tokenId.toString(), extensionMeta))
            : "";
    }
}
