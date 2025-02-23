(** Sorting algorithms implementation *)

val insertion_sort : 'a list -> ('a -> 'a -> int) -> 'a list
(** [insertion_sort lst compare] sorts list [lst] using insertion sort *)

val merge_sort : 'a list -> ('a -> 'a -> int) -> 'a list
(** [merge_sort lst compare] sorts list [lst] using merge sort *)

val quicksort : 'a list -> ('a -> 'a -> int) -> 'a list
(** [quicksort lst compare] sorts list [lst] using quicksort *)

val is_sorted : 'a list -> ('a -> 'a -> int) -> bool
(** [is_sorted lst compare] checks if list [lst] is sorted *)