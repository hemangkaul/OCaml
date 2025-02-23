## Exercise 2: Pattern Matching
Create a function `describe_number` that takes an integer and returns:
- "positive" if > 0
- "negative" if < 0
- "zero" if = 0
```ocaml

(* Test *)
assert (describe_number 5 = "positive")
assert (describe_number (-2) = "negative")
assert (describe_number 0 = "zero")
```

