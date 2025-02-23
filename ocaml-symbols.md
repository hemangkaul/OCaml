# OCaml Symbols and Operators Reference

## Arithmetic Operators

### Basic Arithmetic
- `+` : Integer addition
- `-` : Integer subtraction/negation
- `*` : Integer multiplication
- `/` : Integer division
- `+.` : Floating-point addition
- `-.` : Floating-point subtraction/negation
- `*.` : Floating-point multiplication
- `/.` : Floating-point division
- `**` : Floating-point exponentiation
- `~+` : Integer unary plus
- `~-` : Integer unary minus
- `~+.` : Float unary plus
- `~-.` : Float unary minus

### Modulo and Integer Division
- `mod` : Integer modulo
- `land` : Bitwise AND
- `lor` : Bitwise OR
- `lxor` : Bitwise XOR
- `lnot` : Bitwise NOT
- `lsl` : Logical shift left
- `lsr` : Logical shift right
- `asr` : Arithmetic shift right

## Comparison Operators

### Basic Comparison
- `=` : Structural equality
- `<>` : Structural inequality
- `==` : Physical equality
- `!=` : Physical inequality
- `<` : Less than
- `<=` : Less than or equal
- `>` : Greater than
- `>=` : Greater than or equal
- `compare` : General comparison function

### String and Collection Comparison
- `=?` : Optional equality
- `<?` : Optional less than
- `>?` : Optional greater than
- `<=?` : Optional less than or equal
- `>=?` : Optional greater than or equal

## Boolean Operators
- `&&` : Logical AND
- `||` : Logical OR
- `not` : Logical NOT

## List and Collection Operators
- `::` : Cons operator (add element to front of list)
- `@` : List concatenation
- `^` : String concatenation
- `^.` : Float concatenation in string conversion

## Pattern Matching and Function Operators
- `|` : Pattern matching cases separator
- `->` : Pattern matching arrow / function body delimiter
- `function` : Pattern matching on last argument
- `fun` : Lambda expression
- `when` : Pattern guard

## Reference and Mutable Operators
- `:=` : Reference assignment
- `!` : Reference dereferencing

## Type and Module Operators
- `:` : Type annotation
- `:'a` : Type variable
- `#` : Object type
- `<` : Beginning of object type
- `>` : End of object type
- `..` : Object type extension

## Module and Functor Operators
- `.` : Module access
- `<-` : Mutable field assignment
- `;;` : Expression separator (mainly in toplevel)

## Special Characters
- `_` : Wildcard pattern / Ignored value
- `~` : Labeled argument
- `?` : Optional argument
- `&` : Reference to named argument
- `$` : String interpolation (since OCaml 4.11)
- `%` : Extension point
- `@@` : Application operator (reduce parentheses)
- `@@@` : Extension operator

## Precedence and Associativity

Operators in OCaml follow a strict precedence order, from highest to lowest:

1. Field access, array access (`#`, `.`, `.()`, `.[]`)
2. Function application
3. Unary operators (`-`, `-.`, `!`, `~`, `not`)
4. Power (`**`)
5. Multiplication (`*`, `/`, `*.`, `/.`, `mod`, `land`, `lor`, `lxor`)
6. Addition (`+`, `-`, `+.`, `-.`)
7. Cons operator (`::`)
8. Concatenation (`^`, `@`)
9. Comparisons (`=`, `<>`, `<`, `>`, `<=`, `>=`, `==`, `!=`)
10. Boolean AND (`&&`)
11. Boolean OR (`||`)
12. Assignment (`:=`)
13. Comma (`,`)
14. Function construction (`->`)

## Common Idioms and Usage Notes

### String Operations
```ocaml
let name = "Hello" ^ " " ^ "World"  (* String concatenation *)
```

### List Operations
```ocaml
let list = 1 :: [2; 3; 4]          (* Cons operator *)
let combined = [1; 2] @ [3; 4]      (* List concatenation *)
```

### Function Application
```ocaml
let f x = x + 1
let result = f @@ g @@ h x          (* Application operator *)
```

### Reference Operations
```ocaml
let r = ref 0                       (* Create reference *)
r := 42                            (* Assign to reference *)
let value = !r                      (* Dereference *)
```

## Best Practices

1. **Operator Overloading**: OCaml distinguishes between integer and floating-point operators. Always use the correct version (e.g., `+` vs `+.`).

2. **Pattern Matching**: Use pattern matching with `|` for clarity in complex conditional logic:
   ```ocaml
   match x with
   | 0 -> "zero"
   | n when n < 0 -> "negative"
   | _ -> "positive"
   ```

3. **Reference Usage**: Minimize use of references (`ref`) and mutable state. Prefer immutable data structures when possible.

4. **Type Annotations**: Use type annotations (`:`) when types are ambiguous or for documentation:
   ```ocaml
   let f (x : int) : string = string_of_int x
   ```

## Notes

- OCaml's operator hierarchy is designed to be consistent with mathematical conventions while accommodating functional programming idioms.
- Many operators have special meaning in specific contexts (e.g., `:` in record fields vs type annotations).
- Custom operators can be defined, but should be used judiciously to maintain code readability.
- Some operators (like `@@` and `@@@`) are particularly useful for reducing parentheses and improving code readability.

Remember that clear code is often better than clever use of operators. When in doubt, use more verbose but clearer expressions rather than complex operator combinations.