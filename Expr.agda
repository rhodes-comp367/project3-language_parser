module Expr where


open import Agda.Builtin.Char
  using (Char)
open import Agda.Builtin.IO
  using (IO)
open import Agda.Builtin.List
  using (List)
open import Agda.Builtin.Nat
  using (Nat; suc; zero)
open import Agda.Builtin.String
  using (String)
open import Agda.Builtin.Unit
  using (⊤)




data Expr : Set where
  const : Nat → Expr
  eq    : Expr → Expr → Expr
  add   : Expr → Expr → Expr

  



