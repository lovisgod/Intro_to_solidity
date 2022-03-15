pragma solidity ^0.6.0;

contract Ownable {
     // this is not public
     address owner;

     constructor () public {
         owner = msg.sender;
     }

     modifier onlyOwner() {
      require(msg.sender == owner, "must be owner");
      _;
     }

  }

  contract Vault {
     // this is not public
     string secret;

     constructor (string memory _secret) public {
         secret = _secret;
     }


     function getSecret() public view returns(string memory) {
         return secret;
     }

  }

 contract SecretContract is Ownable {
     // this is not public
     address secretVault;

     constructor (string memory _secret) public {
         Vault _vault = new Vault(_secret);
         secretVault = address(_vault);
         super;
     }


     function getSecret() public view onlyOwner returns(string memory) {
         Vault _vault = Vault(secretVault);
         return _vault.getSecret();
     }

  }