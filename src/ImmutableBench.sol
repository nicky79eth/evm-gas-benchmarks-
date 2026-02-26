contract ImmutableBench {
    address public immutable owner;
    address public storageOwner;

    constructor() {
        owner = msg.sender;
        storageOwner = msg.sender;
    }

    function readImmutable() external view returns (address) {
        return owner;
    }

    function readStorage() external view returns (address) {
        return storageOwner;
    }
}
