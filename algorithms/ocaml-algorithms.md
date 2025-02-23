# OCaml Algorithms Project Structure

```
algorithms/
├── dune-project
├── lib/
│   ├── dune
│   ├── sorting.ml
│   ├── sorting.mli
│   ├── tree.ml
│   └── tree.mli
├── bin/
│   ├── dune
│   └── main.ml
└── test/
    ├── dune
    └── test_algorithms.ml
```

## dune-project
```scheme
(lang dune 3.0)
(name algorithms)
(generate_opam_files true)
(package
 (name algorithms)
 (depends
  (ocaml (>= 4.14.0))
  (dune (>= 3.0))
  (alcotest :with-test)
  (core (>= v0.14.0))
  (benchmark (>= 1.6))))
```

## lib/sorting.mli
```ocaml
(** Sorting algorithms implementation *)

val insertion_sort : 'a list -> ('a -> 'a -> int) -> 'a list
(** [insertion_sort lst compare] sorts list [lst] using insertion sort *)

val merge_sort : 'a list -> ('a -> 'a -> int) -> 'a list
(** [merge_sort lst compare] sorts list [lst] using merge sort *)

val quicksort : 'a list -> ('a -> 'a -> int) -> 'a list
(** [quicksort lst compare] sorts list [lst] using quicksort *)

val is_sorted : 'a list -> ('a -> 'a -> int) -> bool
(** [is_sorted lst compare] checks if list [lst] is sorted *)
```

## lib/sorting.ml
```ocaml
let rec insert x lst compare =
  match lst with
  | [] -> [x]
  | h::t -> if compare x h <= 0 
            then x::lst 
            else h::(insert x t compare)

let rec insertion_sort lst compare =
  match lst with
  | [] -> []
  | h::t -> insert h (insertion_sort t compare) compare

let rec merge l1 l2 compare =
  match l1, l2 with
  | [], l | l, [] -> l
  | h1::t1, h2::t2 ->
      if compare h1 h2 <= 0
      then h1::(merge t1 l2 compare)
      else h2::(merge l1 t2 compare)

let rec split = function
  | [] -> [], []
  | [x] -> [x], []
  | x::y::rest ->
      let l1, l2 = split rest in
      x::l1, y::l2

let rec merge_sort lst compare =
  match lst with
  | [] | [_] -> lst
  | _ ->
      let l1, l2 = split lst in
      merge (merge_sort l1 compare) (merge_sort l2 compare) compare

let rec quicksort lst compare =
  match lst with
  | [] -> []
  | pivot::rest ->
      let lesser, greater = List.partition (fun x -> compare x pivot <= 0) rest in
      quicksort lesser compare @ [pivot] @ quicksort greater compare

let rec is_sorted lst compare =
  match lst with
  | [] | [_] -> true
  | x::y::rest -> compare x y <= 0 && is_sorted (y::rest) compare
```

## lib/tree.mli
```ocaml
type 'a tree =
  | Empty
  | Node of 'a tree * 'a * 'a tree

val insert : 'a -> 'a tree -> ('a -> 'a -> int) -> 'a tree
(** [insert x t compare] inserts value [x] into BST [t] *)

val find : 'a -> 'a tree -> ('a -> 'a -> int) -> bool
(** [find x t compare] checks if value [x] exists in BST [t] *)

val inorder : 'a tree -> 'a list
(** [inorder t] returns inorder traversal of tree [t] *)
```

## lib/tree.ml
```ocaml
type 'a tree =
  | Empty
  | Node of 'a tree * 'a * 'a tree

let rec insert x t compare =
  match t with
  | Empty -> Node(Empty, x, Empty)
  | Node(l, v, r) ->
      if compare x v < 0
      then Node(insert x l compare, v, r)
      else if compare x v > 0
      then Node(l, v, insert x r compare)
      else t

let rec find x t compare =
  match t with
  | Empty -> false
  | Node(l, v, r) ->
      if compare x v = 0 then true
      else if compare x v < 0
      then find x l compare
      else find x r compare

let rec inorder = function
  | Empty -> []
  | Node(l, v, r) -> inorder l @ [v] @ inorder r
```

## test/test_algorithms.ml
```ocaml
open Algorithms
open Alcotest

let test_sorting_algorithm sort_fn () =
  let test_cases = [
    [];
    [1];
    [3; 1; 4; 1; 5; 9; 2; 6; 5; 3; 5];
    List.init 100 (fun _ -> Random.int 1000)
  ] in
  List.iter (fun lst ->
    let sorted = sort_fn lst compare in
    check bool "is_sorted" true (Sorting.is_sorted sorted compare);
    check (list int) "same elements"
      (List.sort compare lst) sorted
  ) test_cases

let test_tree () =
  let t = List.fold_left 
    (fun acc x -> Tree.insert x acc compare)
    Tree.Empty
    [3; 1; 4; 1; 5; 9; 2; 6; 5; 3; 5] in
  check bool "find existing" true (Tree.find 4 t compare);
  check bool "find non-existing" false (Tree.find 7 t compare);
  check (list int) "inorder is sorted"
    [1; 1; 2; 3; 3; 4; 5; 5; 5; 6; 9]
    (Tree.inorder t)

let sorting_test_set = [
  "insertion_sort", `Quick, test_sorting_algorithm Sorting.insertion_sort;
  "merge_sort", `Quick, test_sorting_algorithm Sorting.merge_sort;
  "quicksort", `Quick, test_sorting_algorithm Sorting.quicksort
]

let () =
  run "Algorithms" [
    "sorting", sorting_test_set;
    "tree", ["basic_operations", `Quick, test_tree]
  ]
```

## bin/main.ml
```ocaml
open Algorithms
open Core
open Core_bench.Std

let random_list n = List.init n ~f:(fun _ -> Random.int 10000)

let benchmarks =
  let sizes = [100; 1000; 10000] in
  List.concat_map sizes ~f:(fun size ->
    let input = random_list size in
    [ Bench.Test.create ~name:(Printf.sprintf "insertion_sort_%d" size)
        (fun () -> Sorting.insertion_sort input compare)
    ; Bench.Test.create ~name:(Printf.sprintf "merge_sort_%d" size)
        (fun () -> Sorting.merge_sort input compare)
    ; Bench.Test.create ~name:(Printf.sprintf "quicksort_%d" size)
        (fun () -> Sorting.quicksort input compare)
    ])

let () =
  Command_unix.run (Bench.make_command benchmarks)
```