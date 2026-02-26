// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/MappingVsArray.sol";

contract MappingTest is Test {
    MappingVsArray internal bench;

    address internal user1 = address(0x1);
    address internal user2 = address(0x2);

    function setUp() public {
        bench = new MappingVsArray();

        // Prefill to avoid measuring setup cost in read tests
        bench.add(user1);
        bench.add(user2);
    }

    /*//////////////////////////////////////////////////////////////
                            READ COST
    //////////////////////////////////////////////////////////////*/

    function testReadMappingGas() public view {
        bench.readMap(user1);
    }

    function testReadArrayGas() public view {
        bench.readArray(0);
    }

    /*//////////////////////////////////////////////////////////////
                            WRITE COST
    //////////////////////////////////////////////////////////////*/

    function testWriteMappingAndArrayGas() public {
        bench.add(address(0x3));
    }

    /*//////////////////////////////////////////////////////////////
                        WARM ACCESS TEST
    //////////////////////////////////////////////////////////////*/

    function testMappingWarmAccess() public view {
        bench.readMap(user1); // first read (cold)
        bench.readMap(user1); // second read (warm)
    }

    function testArrayWarmAccess() public view {
        bench.readArray(0);
        bench.readArray(0);
    }
}
