# OCaml First Steps

## Setup

```bash
brew install ocaml
opam init
```
### Optional (for now)

Download OCaml Platform for VSCode

```bash
opam install utop
```

## Test Setup

```bash
dune init proj hello
dune build
dune exec hello
```

## Script

In order to use a script in the OCaml REPL (read evaluate print loop) write a script in an ml file e.g. 

test.ml
```ocaml
let print_hello() = print_string "hello";;
```

```bash
ocaml
OCaml version 5.2.1
Enter #help;; for help.

# #use "test.ml"
```
