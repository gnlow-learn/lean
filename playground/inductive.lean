inductive MyNat where
  | zero: MyNat
  | succ: MyNat → MyNat

#eval MyNat.succ MyNat.zero
