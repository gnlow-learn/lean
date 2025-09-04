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

theorem multi_move_sound (a b: Int) (pre post: Program)
  : evalProg (pre ++ [move a, move b] ++ post)
  = evalProg (pre ++ [move (a+b)] ++ post)
  := by simp [
    evalProg,
    evalExpr,
    Int.add_assoc,
  ]

def optimize: Program → Program
  | [] => []
  | [x] => [x]
  | (move a) :: (move b) :: rest =>
    move (a + b) :: optimize rest

theorem optimize_sound (p: Program)
  : evalProg (optimize p) = evalProg p
  := by
    induction p with
    | nil => rfl
    | cons x xs ih =>
      match x with
      | move a =>
        match xs with
        | [] => rfl
        | cons (move b) rest =>
          rw [optimize]
          -- 여기서 막힘
          sorry

def MyProg := [
  move 10,
  move 20,
]

#eval evalProg MyProg
#eval optimize MyProg
