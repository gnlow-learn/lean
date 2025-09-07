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

## simp
```lean
-- playground/prog.lean
unfold evalProg
rw [foldl_append]
rw [foldl_append]
rw [foldl_cons]
rw [evalExpr]
rw [foldl_cons]
rw [evalExpr]
rw [foldl_append]
rw [foldl_append]
rw [foldl_cons]
rw [evalExpr]
rw [Int.add_assoc]
--
unfold evalProg
repeat rw [foldl_append]
repeat rw [foldl_cons]
repeat rw [evalExpr]
rw [Int.add_assoc]
--
simp only [
  evalProg,
  foldl_append,
  foldl_cons,
  evalExpr,
  Int.add_assoc,
]
--
simp [
  evalProg,
  evalExpr,
  Int.add_assoc,
]
```
- `simp only`는 명시된 규칙만 사용
- `simp`는 기본 라이브러리의 `@[simp]` 규칙도 사용

## memo

###
```lean
def double (x: Nat) := x * 2
```
- 내가 생각했던대로 `double (x: Nat): x * 2`가 되진 않는구나
- `double (x: Nat): Nat`가 됨

###
```lean
instance: Bind List where
  bind l f := List.flatMap f l

#eval [1,2,3] >>= (fun x => [x, x * 2])
```
- Bind List 직접 구현해줘야하네
- 그렇게 해놓은 이유가 있나..?
