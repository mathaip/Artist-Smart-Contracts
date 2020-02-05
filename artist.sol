pragma solidity ^0.6.1;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC721/ERC721.sol";

contract Artist is ERC721 {
    // Collection of artworks by this Artist
    mapping(uint => ArtWork) artworks;
    address artist;
    
    constructor() public {
        artist = msg.sender;
    }
    function createArtwork(uint hashIPFS, string memory Name) public returns (ArtWork) {
           ArtWork artContract = new ArtWork(hashIPFS, Name);
           artworks[hashIPFS] = artContract;
           return artContract;
        }
    function checkArtwork(uint hashIPFS) public view returns(bool) {
        if(artworks[hashIPFS] == ArtWork(0x0)) {
            return true;
        }
        return false;
   }
}