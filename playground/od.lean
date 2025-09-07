inductive Dir where
  | up
  | right
  | down
  | left
  deriving Repr

structure OdMat where
  data
    (x: Int) (y: Int)
    (dir: Dir)
    : Bool

inductive Expr where
  | lpar
  | rpar
  | exit
  | next

open Expr

inductive Comm where
  | move
  | turnCW
  | push (x y: Int) (dir: Dir)
  | pop
  deriving Repr

open Comm

def p := fun
  | lpar => [push 0 0 Dir.left, turnCW]
  | rpar => [pop, turnCW]
  | exit => [turnCW]
  | next => [move, turnCW, turnCW, turnCW]

instance: Bind List where
  bind l f := List.flatMap f l

#eval [lpar] >>= p
#eval [1,2,3] >>= (fun x => [x, x * 2])
