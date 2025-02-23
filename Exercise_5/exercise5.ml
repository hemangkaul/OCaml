let map_option f = 

let compose f g x = 

(* Tests *)
let () = assert (map_option double (Some 3) = Some 6)
let () = assert (map_option double None = None)

let add_one x = x + 1
let times_two x = x * 2
let () = assert (compose add_one times_two 3 = 7)

let () = print_string "All tests passed!\n"