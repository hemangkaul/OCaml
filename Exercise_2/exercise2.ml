let describe_number x = 

let () = assert (describe_number 5 = "positive")
let () = assert (describe_number (-2) = "negative")
let () = assert (describe_number 0 = "zero")
  
let () = print_string "All tests passed!\n"