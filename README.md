## Glitch NFT (Foundry)

Minimal ERC-721 collection with:
- Public minting (anyone can mint)
- Fixed max supply: 16 tokens (IDs 0..15)
- Enumerable (ERC721Enumerable)
- Metadata via base URI set in constructor

### Deployed (Sepolia)
- Contract: [0x5f64ff0979734ddbe59882374082a52537d2342b](https://sepolia.etherscan.io/address/0x5f64ff0979734ddbe59882374082a52537d2342b)

## Minting
Mint is public and enforces a hard cap of 16 tokens.

### Images
All 16 collection images (0..15):

| 0 | 1 | 2 | 3 |
|---|---|---|---|
| ![0](content/images/0.png) | ![1](content/images/1.png) | ![2](content/images/2.png) | ![3](content/images/3.png) |
| 4 | 5 | 6 | 7 |
| ![4](content/images/4.png) | ![5](content/images/5.png) | ![6](content/images/6.png) | ![7](content/images/7.png) |
| 8 | 9 | 10 | 11 |
| ![8](content/images/8.png) | ![9](content/images/9.png) | ![10](content/images/10.png) | ![11](content/images/11.png) |
| 12 | 13 | 14 | 15 |
| ![12](content/images/12.png) | ![13](content/images/13.png) | ![14](content/images/14.png) | ![15](content/images/15.png) |

## Metadata / IPFS
This contract uses a base metadata URI set in the constructor. `tokenURI(tokenId)` returns `string.concat(baseURI, tokenId)`.

Upload images directory to IPFS (recursively):
```bash
cd content/images
ipfs add -r .
```

Upload metadata directory to IPFS (recursively):
```bash
cd ../metadata
ipfs add -r .
```

Use the resulting CID as the constructor `baseMetadataURI`. Can be changed in `script/DeployGlitchNft.s.sol` before deploying.

## Notes
- Max supply is enforced on-chain (IDs 0..15).
- There is no owner; mint is public.
- Base metadata URI is immutable after deployment.