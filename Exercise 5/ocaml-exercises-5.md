## Exercise 5: Higher-Order Functions
Implement:
1. `map_option`: Maps a function over an option type
2. `compose`: Function composition
```ocaml
(* Tests *)
assert (map_option double (Some 3) = Some 6)
assert (map_option double None = None)

let add_one x = x + 1
let times_two x = x * 2
assert (compose add_one times_two 3 = 7)
```