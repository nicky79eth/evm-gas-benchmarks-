// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/ImmutableBench.sol";

contract ImmutableTest is Test {
    ImmutableBench internal bench;

    function setUp() public {
        bench = new ImmutableBench();
    }

    /*//////////////////////////////////////////////////////////////
                        RUNTIME READ
    //////////////////////////////////////////////////////////////*/

    function testReadImmutableGas() public view {
        bench.readImmutable();
    }

    function testReadStorageGas() public view {
        bench.readStorage();
    }

    /*//////////////////////////////////////////////////////////////
                        MULTIPLE READS
    //////////////////////////////////////////////////////////////*/

    function testReadImmutableMultiple() public view {
        bench.readImmutable();
        bench.readImmutable();
        bench.readImmutable();
    }

    function testReadStorageMultiple() public view {
        bench.readStorage();
        bench.readStorage();
        bench.readStorage();
    }

    /*//////////////////////////////////////////////////////////////
                        DEPLOYMENT COST
    //////////////////////////////////////////////////////////////*/

    function testDeploymentGas() public {
        new ImmutableBench();
    }
}
