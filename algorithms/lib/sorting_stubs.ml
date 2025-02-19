let rec insert x lst compare =
  match lst with
  | [] -> 
  | h::t -> 

let rec insertion_sort lst compare =
  match lst with
  | [] -> 
  | h::t -> 

let rec merge l1 l2 compare =
  match l1, l2 with
  | [], l | l, [] -> 
  | h1::t1, h2::t2 ->

let rec split = function
  | [] -> [], []
  | [x] -> [x], []
  | x::y::rest -> 

let rec merge_sort lst compare =
  match lst with
  | [] | [_] -> 
  | _ ->

let rec quicksort lst compare =
  match lst with
  | [] -> 
  | pivot::rest -> 

let rec is_sorted lst compare =
  match lst with
  | [] | [_] -> 
  | x::y::rest -> 