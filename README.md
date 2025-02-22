# VHDL Race Condition Example

This repository demonstrates a potential race condition in VHDL code. The `bad_process` entity shows a situation where a signal (`data_out`) is assigned a value in the same process and clock cycle where it is read, leading to a potential race condition. The solution (`bad_process_solution.vhd`) shows a correct implementation avoiding this race condition by using an intermediate signal and proper signal assignments.

## Race Condition Explanation

A race condition occurs when the order of operations is not guaranteed. In this example, the assignment to `internal_data` and `data_out` happen in the same process in the same clock cycle's positive edge. This means that the order between the assignment to `internal_data` and the assignment to `data_out` is not precisely defined, leading to possible incorrect results, particularly if `data_out` is used in other combinatorial logic. 

## Solution

The race condition is resolved by introducing an intermediate signal and ensuring that assignments are separated by a clock edge. This solution guarantees that combinatorial logic using `data_out` will receive its value after it's been correctly updated.