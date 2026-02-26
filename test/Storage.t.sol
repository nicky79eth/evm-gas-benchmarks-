// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/StorageBench.sol";

contract StorageTest is Test {
    StorageBench internal bench;

    function setUp() public {
        bench = new StorageBench();
        bench.write(100);
    }

    /*//////////////////////////////////////////////////////////////
                            WRITE COST
    //////////////////////////////////////////////////////////////*/

    function testWriteGas() public {
        bench.write(200);
    }

    /*//////////////////////////////////////////////////////////////
                        READ MULTIPLE (NO CACHE)
    //////////////////////////////////////////////////////////////*/

    function testReadMultipleGas() public view {
        bench.readMultiple();
    }

    /*//////////////////////////////////////////////////////////////
                        READ CACHED VERSION
    //////////////////////////////////////////////////////////////*/

    function testReadCachedGas() public view {
        bench.readCached();
    }

    /*//////////////////////////////////////////////////////////////
                    COLD VS WARM ACCESS SIMULATION
    //////////////////////////////////////////////////////////////*/

    function testColdVsWarm() public {
        // First read (cold)
        bench.readCached();

        // Second read in same tx (warm)
        bench.readCached();
    }
}
