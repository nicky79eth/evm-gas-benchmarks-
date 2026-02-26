// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/LoopBench.sol";

contract LoopTest is Test {
    LoopBench internal bench;

    uint256 constant SIZE = 100;

    function setUp() public {
        bench = new LoopBench();

        // Pre-fill array to avoid measuring push cost in loop tests
        for (uint256 i = 0; i < SIZE; i++) {
            bench.push(i + 1);
        }
    }

    /*//////////////////////////////////////////////////////////////
                        LOOP DIRECT LENGTH
    //////////////////////////////////////////////////////////////*/

    function testLoopDirectGas() public view {
        bench.loopDirect();
    }

    /*//////////////////////////////////////////////////////////////
                        LOOP CACHED LENGTH
    //////////////////////////////////////////////////////////////*/

    function testLoopCachedGas() public view {
        bench.loopCached();
    }

    /*//////////////////////////////////////////////////////////////
                        MULTIPLE EXECUTIONS
    //////////////////////////////////////////////////////////////*/

    function testLoopRepeated() public view {
        bench.loopCached();
        bench.loopCached();
    }
}
