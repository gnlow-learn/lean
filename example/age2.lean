-- https://overreacted.io/lean-for-javascript-developers/

def name := "Alice"

def birthYear
(currentYear: Int)
(age: Nat) :=
  currentYear - age

theorem my_theorem
: a + birthYear cy a = cy
:= by
  unfold birthYear
  omega
