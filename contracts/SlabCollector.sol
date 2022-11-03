// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SlabCollector {
    // address public owner;
    uint public balance;
    uint public slab0;
    uint public slab1;
    uint public slab2;
    uint public slab3;
    uint public slab4;

    constructor() public {}

    function addToken(uint _amount) public {
        uint amount = _amount;
        balance += amount;
        require(balance <= 1500 * 10 ** 18, "Not enough capacity in the pool");
        if (balance > 1400 * 10 ** 18 && balance <= 1500 * 10 ** 18) {
            require(slab0<=100 * 10 ** 18, "Slab 0 has reached capacity");
            slab4 = 500 * 10 ** 18;
            slab3 = 400 * 10 ** 18;
            slab2 = 300 * 10 ** 18;
            slab1 = 200 * 10 ** 18;
            slab0 += balance - 1400 * 10 ** 18;
        }
        if (balance > 1200 * 10 ** 18 && balance <= 1400 * 10 ** 18) {
            require(slab1<=200 * 10 ** 18, "Slab 1 has reached capacity");
            slab4 = 500 * 10 ** 18;
            slab3 = 400 * 10 ** 18;
            slab2 = 300 * 10 ** 18;
            slab1 += balance - 1200 * 10 ** 18;
        }
        if (balance > 900 * 10 ** 18 && balance <= 1200 * 10 ** 18) {
            require(slab2<=300 * 10 ** 18, "Slab 2 has reached capacity");
            slab4 = 500 * 10 ** 18;
            slab3 = 400 * 10 ** 18;
            slab2 += balance - 900 * 10 ** 18;
        }
        if (balance > 500 * 10 ** 18 && balance <= 900 * 10 ** 18) {
            require(slab3<=400 * 10 ** 18, "Slab 3 has reached capacity");
            slab4 = 500 * 10 ** 18;
            slab3 += (balance - 500 * 10 ** 18);
        }
        if (balance <= 500 * 10 ** 18) {
            require(slab4<=500 * 10 ** 18, "Slab 4 has reached capacity");
            slab4 += balance;
        }
    }

    function viewSlab() public view returns (string memory) {
        if (balance <= 500 * 10 ** 18) return "Slab 4";
        if (balance > 500 * 10 ** 18 && balance <= 900 * 10 ** 18) return "Slab 3";
        if (balance > 900 * 10 ** 18 && balance <= 1200 * 10 ** 18) return "Slab 2";
        if (balance > 1200 * 10 ** 18 && balance <= 1400 * 10 ** 18) return "Slab 1";
        if (balance > 1400 * 10 ** 18 && balance <= 1500 * 10 ** 18) return "Slab 0";
    }
}