module Test where

open import Agda.Builtin.Nat
open import Agda.Builtin.Char
open import Agda.Builtin.List
open import Agda.Builtin.Equality
open import Agda.Builtin.Bool
open import Agda.Builtin.String 
open import Parser
open import Expr
open import helpers



-- Assume Parser exposes:
--   parseExpr : Parser Expr
--   eval      : Expr → BoolLike
--   pretty    : Expr → List Char


-- === Parser Correctness ===

test-parse-1 : parseExpr (primStringToList "eq 2 3") ≡ just (eq (const 2) (const 3) , [])
test-parse-1 = refl

test-parse-2 : parseExpr (primStringToList "eq 5 5") ≡ just (eq (const 5) (const 5) , [])
test-parse-2 = refl

test-parse-bad : parseExpr (primStringToList "hello") ≡ nothing
test-parse-bad = refl

test-parse-add1 : parseExpr (primStringToList "add 2 2") ≡ just (add (const 2) (const 2) , [])
test-parse-add1 = refl


-- === Eval correctness ===

-- Prove that evaluating eq 2 2 gives true
test-eval-1 : eval (eq (const 2) (const 2)) ≡ true
test-eval-1 = refl

-- Prove that evaluating eq 2 3 gives false
test-eval-2 : eval (eq (const 2) (const 3)) ≡ false
test-eval-2 = refl

-- === Parser to Eval correctness ===

test-parse-eval-1 : parseAndEval (primStringToList "eq 2 2") ≡ just true
test-parse-eval-1 = refl

test-parse-eval-2 : parseAndEval (primStringToList "eq 2 3") ≡ just false
test-parse-eval-2 = refl

 
-- === Parser to Pretty Print correctness ===


-- Prove that parsing and pretty-printing "eq 2 3" gives back "eq 2 3"
test-parseAndPrint-1 : parseAndPrint (primStringToList "eq 2 3") ≡ just (primStringToList "eq 2 3")
test-parseAndPrint-1 = refl

-- Prove that parsing and pretty-printing "eq 5 5" gives back "eq 5 5"
test-parseAndPrint-2 : parseAndPrint (primStringToList "eq 5 5") ≡ just (primStringToList "eq 5 5")
test-parseAndPrint-2 = refl