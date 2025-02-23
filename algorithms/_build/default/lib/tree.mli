type 'a tree =
  | Empty
  | Node of 'a tree * 'a * 'a tree

val insert : 'a -> 'a tree -> ('a -> 'a -> int) -> 'a tree
(** [insert x t compare] inserts value [x] into BST [t] *)

val find : 'a -> 'a tree -> ('a -> 'a -> int) -> bool
(** [find x t compare] checks if value [x] exists in BST [t] *)

val inorder : 'a tree -> 'a list
(** [inorder t] returns inorder traversal of tree [t] *)