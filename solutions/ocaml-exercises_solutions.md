# OCaml Beginner Exercises

## Exercise 1: Basic Functions
Write a function `double` that takes an integer and returns twice its value.
```ocaml
let double x = x * 2

(* Test *)
assert (double 4 = 8)
assert (double (-3) = -6)
```

## Exercise 2: Pattern Matching
Create a function `describe_number` that takes an integer and returns:
- "positive" if > 0
- "negative" if < 0
- "zero" if = 0
```ocaml
let describe_number x =
  match x with
  | x when x > 0 -> "positive"
  | x when x < 0 -> "negative"
  | _ -> "zero"

(* Test *)
assert (describe_number 5 = "positive")
assert (describe_number (-2) = "negative")
assert (describe_number 0 = "zero")
```

## Exercise 3: Lists
Write three functions:
1. `sum_list`: Calculate sum of a list
2. `max_list`: Find maximum value (assume non-empty list)
3. `is_sorted`: Check if list is sorted in ascending order
```ocaml
let rec sum_list = function
  | [] -> 0
  | x::xs -> x + sum_list xs

let rec max_list = function
  | [x] -> x
  | x::xs -> max x (max_list xs)
  | [] -> failwith "Empty list"

let rec is_sorted = function
  | [] | [_] -> true
  | x::y::rest -> x <= y && is_sorted (y::rest)

(* Tests *)
assert (sum_list [1;2;3;4] = 10)
assert (max_list [1;3;2;5;4] = 5)
assert (is_sorted [1;2;3;4] = true)
assert (is_sorted [1;3;2;4] = false)
```

## Exercise 4: Custom Types
Define a type `shape` that can be Circle, Rectangle, or Triangle. Write a function to calculate area.
```ocaml
type shape =
  | Circle of float
  | Rectangle of float * float
  | Triangle of float * float

let area = function
  | Circle r -> 3.14159 *. r *. r
  | Rectangle (w, h) -> w *. h
  | Triangle (b, h) -> 0.5 *. b *. h

(* Tests *)
assert (abs_float(area (Circle 2.0) -. 12.56636) < 0.0001)
assert (area (Rectangle (2.0, 3.0)) = 6.0)
assert (area (Triangle (4.0, 3.0)) = 6.0)
```

## Exercise 5: Higher-Order Functions
Implement:
1. `map_option`: Maps a function over an option type
2. `compose`: Function composition
```ocaml
let map_option f = function
  | None -> None
  | Some x -> Some (f x)

let compose f g x = f (g x)

(* Tests *)
assert (map_option double (Some 3) = Some 6)
assert (map_option double None = None)

let add_one x = x + 1
let times_two x = x * 2
assert (compose add_one times_two 3 = 7)
```