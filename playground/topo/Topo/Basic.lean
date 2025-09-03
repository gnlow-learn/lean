-- Powered by ChatGPT

import Mathlib.Data.Real.Basic

set_option linter.style.commandStart false

structure MetricSpace (X: Type) where
  d:    X -> X -> ℝ
  nneg: d x y >= 0
  eqz:  d x y = 0 ↔ x = y
  symm: d x y = d y x
  tri:  d x y ≤ d x z + d z y

def l1 (p q: ℝ × ℝ) := |p.1 - q.1| + |p.2 - q.2|

def R2_L1_metric: MetricSpace (ℝ × ℝ) where
  d := l1

  nneg := by
    intro x y
    have hx: 0 ≤ |x.1 - y.1| := abs_nonneg _
    have hy: 0 ≤ |x.2 - y.2| := abs_nonneg _
    exact add_nonneg hx hy

  eqz := sorry

  symm := by
    intro x y
    simp [l1, abs_sub_comm]

  tri := by
    intro x y z
    have hx
      : |x.1 - y.1| ≤ |x.1 - z.1| + |z.1 - y.1|
      := abs_sub_le _ _ _
    have hy
      : |x.2 - y.2| ≤ |x.2 - z.2| + |z.2 - y.2|
      := abs_sub_le _ _ _
    have := add_le_add hx hy
    simpa [l1, add_comm, add_left_comm, add_assoc]
