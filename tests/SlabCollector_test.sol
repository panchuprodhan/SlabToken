// SPDX-License-Identifier: GPL-3.0
        
pragma solidity >=0.4.22 <0.9.0;

// This import is automatically injected by Remix
import "remix_tests.sol"; 

// This import is required to use custom transaction context
// Although it may fail compilation in 'Solidity Compiler' plugin
// But it will work fine in 'Solidity Unit Testing' plugin
import "remix_accounts.sol";
import "../SlabCollector.sol";

// File name has to end with '_test.sol', this file can contain more than one testSuite contracts
contract testSuite {
    SlabCollector slab;

    /// 'beforeAll' runs before all other tests
    /// More special functions are: 'beforeEach', 'beforeAll', 'afterEach' & 'afterAll'
    function beforeAll() public {
        // <instantiate contract>
        slab = new SlabCollector();
    }

    function addAmountCheck1() public returns (bool) {
        slab.addToken(400000000000000000000);
        return Assert.equal(slab.viewSlab(), "Slab 4", "Slab is not 4");
    }
    function addAmountCheck2() public returns (bool) {
        slab.addToken(300000000000000000000);
        return Assert.equal(slab.viewSlab(), "Slab 3", "Slab is not 3");
    }
    function addAmountCheck3() public returns (bool) {
        slab.addToken(300000000000000000000);
        return Assert.equal(slab.viewSlab(), "Slab 2", "Slab is not 2");
    }
    function addAmountCheck4() public returns (bool) {
        slab.addToken(300000000000000000000);
        return Assert.equal(slab.viewSlab(), "Slab 1", "Slab is not 1");
    }
    
}
    