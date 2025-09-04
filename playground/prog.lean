inductive Expr where
  | move (n: Float)

instance: ToString Expr where
  toString
    | Expr.move n => s!"move {n}"

abbrev Program := List Expr

def eval (prog: Program) :=
  prog.foldl (fun (pos: Float) (expr: Expr) =>
    match expr with
    | Expr.move n => pos + n
  ) 0

def MyProg := [
  Expr.move 10,
  Expr.move 20,
]

#eval eval MyProg
