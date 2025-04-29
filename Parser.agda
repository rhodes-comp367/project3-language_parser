module Parser where

open import Agda.Builtin.Nat
open import Agda.Builtin.Char
open import Agda.Builtin.List
open import Agda.Builtin.Equality
open import Agda.Builtin.Bool
 
open import Expr
open import helpers

Parser : Set → Set
Parser A = List Char → Maybe (A × List Char)


-- Convert a Char to a Nat, only supporting digits
charToNat : Char → Maybe Nat
charToNat '0' = just 0
charToNat '1' = just 1
charToNat '2' = just 2
charToNat '3' = just 3
charToNat '4' = just 4
charToNat '5' = just 5
charToNat '6' = just 6
charToNat '7' = just 7
charToNat '8' = just 8
charToNat '9' = just 9
charToNat _   = nothing



parseExpr : Parser Expr
parseExpr ('e' ∷ 'q' ∷ ' ' ∷ c1 ∷ ' ' ∷ c2 ∷ rest)
  with charToNat c1 | charToNat c2
... | just n1 | just n2 = just (eq (const n1) (const n2) , rest)
... | _      | _        = nothing
parseExpr ('a' ∷ 'd' ∷ 'd' ∷ ' ' ∷ c1 ∷ ' ' ∷ c2 ∷ rest)
  with charToNat c1 | charToNat c2
... | just n1 | just n2 = just (add (const n1) (const n2) , rest)
... | _      | _        = nothing
parseExpr _ = nothing



-- Evaluate an expression
eval : Expr → BoolLike
eval (eq (const x) (const y)) with x == y
... | true  = true  -- Built-in `true` maps to `BoolLike.true`
... | false = false -- Built-in `false` maps to `BoolLike.false`
eval _ = false



-- Convert Nat to Char
natToChar : Nat → Char
natToChar 0 = '0'
natToChar 1 = '1'
natToChar 2 = '2'
natToChar 3 = '3'
natToChar 4 = '4'
natToChar 5 = '5'
natToChar 6 = '6'
natToChar 7 = '7'
natToChar 8 = '8'
natToChar 9 = '9'
natToChar _ = '?'  -- fallback if somehow needed


-- Pretty-print an Expr
pretty : Expr → List Char
pretty (const n) = natToChar n ∷ []
pretty (eq (const x) (const y)) =
  'e' ∷ 'q' ∷ ' ' ∷ natToChar x ∷ ' ' ∷ natToChar y ∷ []
pretty _ = 'E' ∷ 'R' ∷ 'R' ∷ []

parseAndEval : List Char → Maybe BoolLike
parseAndEval input = map (eval ∘ fst) (parseExpr input)

parseAndPrint : List Char → Maybe (List Char)
parseAndPrint input = map (pretty ∘ fst) (parseExpr input)
