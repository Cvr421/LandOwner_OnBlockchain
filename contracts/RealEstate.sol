//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";


contract RealEstate is ERC721URIStorage {
   using Counters for Counters.Counter;
   Counters.Counter private _tokenIds;

   constructor() ERC721("Real Estate","REAL"){}

// mint: This function allows any user to mint (create) a new NFT. Here’s a breakdown of what happens:
// _tokenIds.increment(): Increments the _tokenIds counter, generating a new unique token ID.
// newItemId: Stores the current value of _tokenIds, which is the ID of the new token.
// _mint(msg.sender, newItemId): Mints the new token and assigns ownership to the caller (msg.sender).
// _setTokenURI(newItemId, tokenURI): Associates the token ID with the provided URI (tokenURI). This URI typically points to metadata about the real estate property, like an image or description.
// return newItemId: Returns the ID of the newly minted token to the caller.


   function mint(string memory tokenURI)public returns(uint256){
    _tokenIds.increment();

    uint256 newItemId = _tokenIds.current();
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;

   }
   function totalSupply() public view returns(uint256) {
      return _tokenIds.current();
   }

   


}   