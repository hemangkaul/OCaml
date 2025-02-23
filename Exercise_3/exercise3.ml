let rec sum_list =

let rec max_list =

let rec is_sorted =

let () = assert (sum_list [1;2;3;4] = 10)
let () = assert (max_list [1;3;2;5;4] = 5)
let () = assert (is_sorted [1;2;3;4] = true)
let () = assert (is_sorted [1;3;2;4] = false)

let () = print_string "All tests passed!\n"