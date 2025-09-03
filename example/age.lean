-- https://overreacted.io/lean-for-javascript-developers/

def name := "Alice"
def age := 42
def birthYear := 2025 - age

theorem my_theorem
  : age + birthYear = 2025
  := by decide
