contract MappingVsArray {
    mapping(address => uint256) public map;
    address[] public users;

    function add(address user) external {
        map[user] = 1;
        users.push(user);
    }

    function readMap(address user) external view returns (uint256) {
        return map[user];
    }

    function readArray(uint i) external view returns (address) {
        return users[i];
    }
}
