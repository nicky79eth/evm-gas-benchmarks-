contract StorageBench {
    uint256 public value;

    function write(uint256 v) external {
        value = v;
    }

    function readMultiple() external view returns (uint256) {
        return value + value + value;
    }

    function readCached() external view returns (uint256) {
        uint256 v = value;
        return v + v + v;
    }
}
