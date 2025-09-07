inductive Dir where
  | up
  | right
  | down
  | left

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

instance: ToString Expr where
  toString
    | Expr.lpar => "("
    | Expr.rpar => ")"
    | Expr.exit => "x"
    | Expr.next => "-"

instance: ToString (List Expr) where
  toString
    | [] => ""
    | h :: t => (toString h) ++ (toString t)
