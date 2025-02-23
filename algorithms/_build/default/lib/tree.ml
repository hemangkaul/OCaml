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