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