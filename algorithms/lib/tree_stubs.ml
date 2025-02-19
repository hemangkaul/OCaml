type 'a tree =
  | Empty
  | Node of 'a tree * 'a * 'a tree

let rec insert x t compare =
  match t with
  | Empty -> 
  | Node(l, v, r) ->

let rec find x t compare =
  match t with
  | Empty ->
  | Node(l, v, r) ->

let rec inorder = function
  | Empty -> 
  | Node(l, v, r) -> 