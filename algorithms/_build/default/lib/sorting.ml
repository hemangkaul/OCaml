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