inductive Expr where
  | move (n: Int)

instance: ToString Expr where
  toString
    | Expr.move n => s!"move {n}"

abbrev Program := List Expr

def evalExpr (pos: Int) (expr: Expr) :=
  match expr with
  | Expr.move n => pos + n

def evalProg (prog: Program) :=
  prog.foldl evalExpr 0

open Expr List

theorem multi_move_sound (a b: Int) (pre: Program)
  : evalProg (pre ++ [move a, move b] ++ post)
  = evalProg (pre ++ [move (a+b)] ++ post)
  := by simp [
    evalProg,
    evalExpr,
    Int.add_assoc,
  ]

def MyProg := [
  move 10,
  move 20,
]

#eval evalProg MyProg
