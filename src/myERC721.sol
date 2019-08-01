pragma solidity ^0.5.6;

import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v2.3.0/contracts/token/ERC721/ERC721.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v2.3.0/contracts/token/ERC721/ERC721Metadata.sol";
import "https://raw.githubusercontent.com/OpenZeppelin/openzeppelin-contracts/v2.3.0/contracts/token/ERC721/ERC721Mintable.sol";


contract MyERC721 is ERC721, ERC721Mintable, ERC721Metadata {
    
    // base URI for token meta data
    string _baseURI = "https://raw.githubusercontent.com/bjoernwe/eth_my_erc721/master/res/";
    
    // Constructor with hard-coded name and symbol
    constructor() public ERC721Metadata("CC", "CC") { }
    
    
    /**
     * @dev Returns the base URI for all tokens
     */
    function baseTokenURI() public view returns (string memory) {
        return _baseURI;
    }
    
    /**
     * @dev Minters can set a new base URI for tokens
     */
    function setNewBaseTokenURI(string memory newBaseURI) public onlyMinter {
        _baseURI = newBaseURI;
    }
    
    /**
     * @dev Returns an URI for a given token ID
     */
    function tokenURI(uint256 tokenId) public view returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return string(abi.encodePacked(baseTokenURI(), '0'));
    }

}

