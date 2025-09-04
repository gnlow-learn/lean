# lean
```sh
lean example/hello.lean
```

## syntax

### inductive
```lean
inductive MyNat where
  | zero: MyNat
  | succ: MyNat → MyNat

#eval MyNat.succ MyNat.zero
```
- algebraic data type
- enum

### structure
```lean
structure Person where
  name: String
  age:  Nat
```
- struct

### class
```lean
class Add (α: Type) where
  add: α → α → α
```
- typeclass

#### instance
```lean
instance: Add Nat where
    add x y := x + y
```

### abbrev
- alias

### axiom
```lean
axiom all_nats_ge_zero (n: Nat): n ≥ 0
```
