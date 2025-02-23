type shape =

let area =

(* Tests *)
let () = assert (abs_float(area (Circle 2.0) -. 12.56636) < 0.0001)
let () = assert (area (Rectangle (2.0, 3.0)) = 6.0)
let () = assert (area (Triangle (4.0, 3.0)) = 6.0)

let () = print_string "All tests passed!\n"