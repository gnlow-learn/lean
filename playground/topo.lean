structure MetricSpace (X: Type) where
  d:    X -> X -> Nat
  nneg: d x y >= 0
  eqz:  d x y = 0 ↔ x = y
  symm: d x y = d y x
  tri:  d x y ≤ d x z + d z y
