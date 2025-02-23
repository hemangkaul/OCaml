
## Exercise 4: Custom Types
Define a type `shape` that can be Circle, Rectangle, or Triangle. Write a function to calculate area.
```ocaml
(* Tests *)
assert (abs_float(area (Circle 2.0) -. 12.56636) < 0.0001)
assert (area (Rectangle (2.0, 3.0)) = 6.0)
assert (area (Triangle (4.0, 3.0)) = 6.0)
```

