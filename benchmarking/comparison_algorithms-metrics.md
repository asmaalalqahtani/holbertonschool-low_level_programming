# Comparison Algorithms Metrics

Compiled with: `gcc -Wall -Werror -Wextra -pedantic -std=gnu99 comparison_algorithms.c -o comparison_algorithms`

## Run 1
```
Naive algorithm result: 625025000
Naive algorithm time: 0.772620 seconds
Single-pass algorithm result: 25000
Single-pass algorithm time: 0.000031 seconds
```

## Run 2
```
Naive algorithm result: 625025000
Naive algorithm time: 0.760278 seconds
Single-pass algorithm result: 25000
Single-pass algorithm time: 0.000031 seconds
```

## Run 3
```
Naive algorithm result: 625025000
Naive algorithm time: 0.760984 seconds
Single-pass algorithm result: 25000
Single-pass algorithm time: 0.000031 seconds
```

## Execution Times

| Run | Naive (A) seconds | Single-pass (B) seconds |
|-----|-------------------|-------------------------|
| 1 | 0.772620 | 0.000031 |
| 2 | 0.760278 | 0.000031 |
| 3 | 0.760984 | 0.000031 |
| **Average** | **0.764627** | **0.000031** |

## Relative Difference

Average A / Average B = 0.764627 / 0.000031 = 24665

**Implementation A (naive) is ~24665 times slower than implementation B (single-pass).**
