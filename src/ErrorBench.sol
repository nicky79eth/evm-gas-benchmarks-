contract ErrorBench {
    error CustomError();

    function withString(uint x) external pure {
        require(x > 10, "Invalid value");
    }

    function withCustom(uint x) external pure {
        if (x <= 10) revert CustomError();
    }
}
