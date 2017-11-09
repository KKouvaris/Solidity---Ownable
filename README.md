# Solidity---Ownable

## Summary

"Ownable" is a smart contract written in Solidity to provide ownership functionality for the derived contracts.
For testing, we use a toy storage smart contract, OwnedStorage. This contract derives from the Ownable contract and inherits all of its state variable and methods. The instantiated contract is thus owned by the person (sender) who creates it.

## Testing ownership

### In a CLI:
1. `testrpc` // start running a virtual node
2. (locate path)
3. `truffle compile`
4. `truffle migrate --reset`
5. `truffle console`

### In the truffle console:
1. `own = OwnedStorage.deployed()` // deploy contract
2. `own.then(function(instance){return instance.set(10);})` // store the value 10
3. `own.then(function(instance){return instance.get();})` // get the storeData value, 10
4. `own.then(function(instance){return instance.get(12, {from: "Different Address"});})` // try calling the 'set' function using an alternative address, e.g., 0x71d3ad80426663575afd7b99f18290f16eedbd8d. We get an error message, since the user calling the function does not correspond to the owner.
5. `own.then(function(instance){return instance.get();})` // get the storeData value, 10 -- the value has not changed
6. `own.then(function(instance){return instance.deactive({from: "Different Address"});})` // try calling the 'deactive' function using an alternative address, e.g., 0x71d3ad80426663575afd7b99f18290f16eedbd8d. We get an error message, since the user calling the function does not correspond to the owner. Note that the onlyOwner modifier is being used in the base contract Ownable, in the internal function 'kill()', and not in the derived contract, OwnedStorage.
7. `own.then(function(instance){return instance.deactive();})` // deactivates the current contract



