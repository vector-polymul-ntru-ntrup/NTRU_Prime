
This repository accompanies with the paper **Algorithmic Views of Vectorized Polynomial Multipliers -- NTRU Prime** at
[International Conference on Applied Cryptography and Network Security, Part II, 2024](https://link.springer.com/chapter/10.1007/978-3-031-54773-7_2).
The paper is also available at [ePrint 2023/1580](https://eprint.iacr.org/2023/1580).

Authors:
- [Vincent Hwang](https://vincentvbh.github.io/) `vincentvbh7@gmail.com`
- [Chi-Ting Liu](https://www.linkedin.com/in/chi-ting-liu/) `gting906@gmail.com`
- [Bo-Yin Yang](https://homepage.iis.sinica.edu.tw/pages/byyang/) `by@crypto.tw`

# Overview of This Artifact

## Raspberry pi 4
- Cortex-A72.
- 64-bit Armv8.0-A.
- No hardware support for cryptographic operations.

## Schemes and Parameters
- NTRU Prime
    - `ntrulpr761`
    - `sntrup761`

## Our Environment for Benchmarking
- Ubuntu 22.04.1
- GCC 11.2.0

## Minimum Requirements (Theoretically)
- A hardware supporting 64-bit Armv8.0-A.
- A C compiler.

## Additional Tests for Compilations
- Raspberry pi 4, Uubntu 22.04.1, clang 14.0.0.
- Apple M1, macOS Monterey, clang 13.1.6.
- Apple M1, macOS Monterey, gcc 11.3.0.

# Structure of This Artifact
- `cycles`: Code for accessing cycle counters.
- `enable_ccr`: Something that should be done prior to accessing cycle counters.
- `hash`: `aes`, `fips202`, `sha2`.
- `randombytes`: Randombytes. From system by default, switch to `chacha20` for pseudorandom.
- `sort`: `crypto_sort_int32` and `crypto_sort_uint32`.
- `ntrulpr761`
- `sntrup761`

# How to Test for Correctness
Go to the folders `{scheme}/{implementation}/` and type `make` where `{scheme}` is one of the following.
- `ntrulpr761`
- `sntrup761`

The following binaries will be produced.
- `test`
- `testvectors`


`test` tests for the key encapsulation mechanisim. `OK KEYS` means success and `ERROR KEYS` means that the resulting keys are different.
`testvectors` prints all the bytes computed from `crypto_kem_keypair`, `crypto_kem_enc`, and `crypto_kem_dec`.
Implementations targeting the same parameter should have the same testvectors.
We compare our implementations with the reference implementations.


# How to Benchmark
Go to the folders `{scheme}/{implementation}/` and type `make speed` where `{scheme}` is one of the following.
- `ntrulpr761`
- `sntrup761`
The binary `speed` will be produced.

Additionally, there are various profiling code as follows (compile with `make XXX` where `XXX` is one of the following targets).
- `ntrulpr761`
    - `aarch64_gt_rader_bruun`, `aarch64_gt`, `aarch64_gt_schönhage`
        - `speed_arith`
        - `speed_encode_decode`
        - `speed_hash`
        - `speed_polymul`
        - `speed_rand`
        - `speed_sort`
- `sntrup761`
    - `aarch64_gt_rader_bruun`, `aarch64_gt`, `aarch64_gt_schönhage`
        - `speed_arith`
        - `speed_encode_decode`
        - `speed_hash`
        - `speed_polymul`
        - `speed_rand`
        - `speed_sort`
    - `ref`
        - `speed_arith`
        - `speed_encode_decode`
        - `speed_polymul`
        - `speed_sort`

