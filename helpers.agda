open import Agda.Builtin.String
open import Agda.Builtin.List
open import Agda.Builtin.Char
open import Agda.Builtin.Nat
open import Agda.Builtin.Bool
open import Agda.Builtin.Equality


module helpers where



data _×_ (A B : Set) : Set where
  _,_ : A → B
    → A × B

fst : ∀ {A B : Set} → A × B → A
fst (a , b) = a

snd : ∀ {A B : Set} → A × B → B
snd (a , b) = b


data Maybe (A : Set) : Set where
  nothing : Maybe A
  just    : A → Maybe A

-- Define the ⊤ type (top / unit)
data ⊤ : Set where
  tt : ⊤

-- Function composition
_∘_ : ∀ {A B C : Set} → (B → C) → (A → B) → A → C
(f ∘ g) x = f (g x)

-- Map for Maybe
map : ∀ {A B : Set} → (A → B) → Maybe A → Maybe B
map f nothing = nothing
map f (just x) = just (f x)

-- Evaluation result
data BoolLike : Set where
  true  : BoolLike
  false : BoolLike
  







