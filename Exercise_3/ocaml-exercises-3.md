## Exercise 3: Lists
Write three functions:
1. `sum_list`: Calculate sum of a list
2. `max_list`: Find maximum value (assume non-empty list)
3. `is_sorted`: Check if list is sorted in ascending order
```ocaml
(* Tests *)
assert (sum_list [1;2;3;4] = 10)
assert (max_list [1;3;2;5;4] = 5)
assert (is_sorted [1;2;3;4] = true)
assert (is_sorted [1;3;2;4] = false)
```
