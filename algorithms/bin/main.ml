open Algorithms
open Core
open Core_bench

let random_list n = List.init n ~f:(fun _ -> Random.int 10000)

let benchmarks =
  let sizes = [100; 1000; 10000] in
  List.concat_map sizes ~f:(fun size ->
    let input = random_list size in
    [ Bench.Test.create ~name:(Printf.sprintf "insertion_sort_%d" size)
        (fun () -> Sorting.insertion_sort input compare)
    ; Bench.Test.create ~name:(Printf.sprintf "merge_sort_%d" size)
        (fun () -> Sorting.merge_sort input compare)
    ; Bench.Test.create ~name:(Printf.sprintf "quicksort_%d" size)
        (fun () -> Sorting.quicksort input compare)
    ])

let () =
  Command_unix.run (Bench.make_command benchmarks)