## Using Scripts

In order to use a script in the OCaml REPL (read evaluate print loop) write a script in an ml file e.g. 

test.ml:

```ocaml
let print_hello() = print_string "hello world!\n"
```

then run it in the top-level REPL as such:

```bash
$ ocaml
OCaml version 5.2.1
Enter #help;; for help.

# #use "test.ml";;
hello world!
val print_hello : unit = ()
#
```