# Baseline Gas Benchmark

This document defines the baseline gas costs used as a reference
for all optimizations in this repository.

The purpose of a baseline is:

- Establish reproducible gas numbers
- Provide comparison anchors
- Detect regressions
- Measure real optimization impact

---

## Environment

- Solidity: 0.8.24
- Foundry: latest stable
- EVM: Cancun / Shanghai compatible
- Optimizer: enabled
- Runs: 200

All tests are executed with:

forge test --gas-report

---

## Measurement Philosophy

Gas measurement must:

1. Avoid setup contamination
2. Avoid constructor gas interference
3. Isolate the exact logic being benchmarked
4. Run under identical state conditions

All benchmark contracts:

- Pre-initialize storage in setUp()
- Separate read and write tests
- Avoid unnecessary branching
- Use deterministic inputs

---

## Baseline Metrics

Below are reference gas costs measured on a standard machine.

### 1. Pure Function Call

function pureAdd(uint256 a, uint256 b) pure returns (uint256)

Gas:
~ 150–250

---

### 2. SLOAD (Cold)

First access of a storage slot:

~ 2100 gas

---

### 3. SLOAD (Warm)

Subsequent access within same transaction:

~ 100 gas

---

### 4. SSTORE (0 → non-zero)

~ 20,000 gas

---

### 5. SSTORE (non-zero → non-zero)

~ 5,000 gas

---

### 6. Memory Expansion (small)

Minimal cost unless large allocation

---

### 7. Keccak256

~ 30 + memory cost

Mapping read includes:

keccak256(key, slot) + SLOAD

---

## Why Baseline Matters

Without a baseline:

- You cannot prove optimization
- You cannot quantify improvement
- You cannot compare techniques objectively

Example:

If Loop A = 42,000 gas  
and Loop B = 39,000 gas  

Optimization = 3,000 gas  
Improvement = 7.14%

Without baseline → meaningless numbers.

---

## Benchmark Rules

All benchmark tests must:

- Avoid console.log
- Avoid event emission
- Avoid branching unless testing branching
- Avoid dynamic memory unless required

---

## Gas Regression Detection

To detect regression:

1. Run forge test --gas-report
2. Compare against baseline numbers
3. Flag if deviation > 3%

CI integration recommended.

---

## Future Extensions

- Opcode-level breakdown
- Assembly vs Solidity comparison
- Packed vs unpacked storage benchmark
- Cold access stress testing
- Calldata vs memory comparison

---

## Conclusion

This baseline document serves as the foundational
reference for all gas optimization experiments
in this repository.

Every optimization must justify itself
against these baseline metrics.
