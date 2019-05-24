{-# language LambdaCase #-}

module SubexpressionsPlugin where

import HsDecls
import HsExpr

f :: HsDecl pass -> [HsDecl pass]
f ValD{} = undefined
f _ = []

directSubexpressions :: HsExpr pass -> [HsExpr pass]
directSubexpressions = \case
  HsApp _x _f _a -> [] -- both f and a are exprs themselves
  OpApp _x _a _op _b -> undefined -- (a op), (op b)
  ExplicitTuple _x _tupArg _boxity -> [] -- covered via exprs in tupArg
  ExplicitSum{} -> [] -- unboxed sum
  HsDo{} -> undefined -- ?

