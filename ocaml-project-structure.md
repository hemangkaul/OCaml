# OCaml Project Structure Guide

## Basic Project Layout
```
myproject/
├── dune-project     # Project metadata and configuration
├── lib/             # Library code directory
│   ├── dune        # Build configuration for library files
│   ├── lib.ml      # Library implementation
│   └── lib.mli     # Interface file (optional)
├── bin/             # Executable files
│   ├── dune        # Build configuration for executables
│   └── main.ml     # Main program entry point
├── test/            # Test files
│   ├── dune        # Build configuration for tests
│   └── test.ml     # Test implementations
└── README.md       # Project documentation
```

## Key Files Explained

### dune-project
```scheme
(lang dune 3.0)
(name myproject)
(version 0.1.0)
(generate_opam_files true)
(package
 (name myproject)
 (synopsis "Project description")
 (depends
  (ocaml (>= 4.14.0))
  (dune (>= 3.0.0))
  (alcotest :with-test)))
```

### lib/dune
```scheme
(library
 (name myproject)
 (public_name myproject)
 (libraries base stdio))
```

### bin/dune
```scheme
(executable
 (name main)
 (public_name myproject)
 (libraries myproject))
```

### test/dune
```scheme
(test
 (name test)
 (libraries myproject alcotest))
```

## Common File Types

- `.ml`: Implementation files
- `.mli`: Interface files (signatures)
- `dune`: Build configuration
- `.opam`: Package management
- `_build/`: Build artifacts (auto-generated)

## Creating a New Project

1. Initialize project:
```bash
dune init project myproject
cd myproject
```

2. Build project:
```bash
dune build
```

3. Run executable:
```bash
dune exec myproject
```

4. Run tests:
```bash
dune test
```

## Best Practices

1. Separate interface (.mli) and implementation (.ml) files
2. Use modules to organize code
3. Place executables in bin/ directory
4. Keep library code in src/
5. Write tests in test/
6. Document dependencies in dune-project

## Module Structure Example

```ocaml
(* src/lib.mli *)
module User : sig
  type t
  val create : string -> int -> t
  val name : t -> string
  val age : t -> int
end

(* src/lib.ml *)
module User = struct
  type t = {
    name: string;
    age: int;
  }
  
  let create name age = {name; age}
  let name t = t.name
  let age t = t.age
end
```