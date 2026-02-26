contract LoopBench {
    uint256[] public arr;

    function push(uint256 x) external {
        arr.push(x);
    }

    function loopDirect() external view returns (uint256 sum) {
        for (uint i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
    }

    function loopCached() external view returns (uint256 sum) {
        uint len = arr.length;
        for (uint i = 0; i < len; i++) {
            sum += arr[i];
        }
    }
}
