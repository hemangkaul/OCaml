let double x =

let () = assert (double 4 = 8)
let () = assert (double (-3) = -6)

let () = print_string "All tests passed!\n"