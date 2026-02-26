// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "../src/ErrorBench.sol";

contract ErrorTest is Test {
    ErrorBench internal bench;

    function setUp() public {
        bench = new ErrorBench();
    }

    /*//////////////////////////////////////////////////////////////
                        SUCCESS PATH
    //////////////////////////////////////////////////////////////*/

    function testWithStringSuccessGas() public view {
        bench.withString(20);
    }

    function testWithCustomSuccessGas() public view {
        bench.withCustom(20);
    }

    /*//////////////////////////////////////////////////////////////
                        REVERT PATH
    //////////////////////////////////////////////////////////////*/

    function testWithStringRevertGas() public {
        vm.expectRevert(bytes("Invalid value"));
        bench.withString(5);
    }

    function testWithCustomRevertGas() public {
        vm.expectRevert(ErrorBench.CustomError.selector);
        bench.withCustom(5);
    }
}
