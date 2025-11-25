{-# OPTIONS_GHC -fno-warn-tabs #-}
{-#LANGUAGE GADTs#-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant lambda" #-}
{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Use lambda-case" #-}

module Polinomios where

type Monomio = (Int, Int)
type Polinomio = [Monomio]

-- ======================
-- POLINOMIOS
-- ======================
--ENTREGA DE DANTE PUERTO (360160) Y LUCAS VILLAMIL (352138)

--1)
agregarMon :: Monomio -> Polinomio -> Polinomio
agregarMon = \m -> \p -> case m of{
        (0,e)->p;
        (c,e)-> case p of{
            []->[m];
            x:xs-> case x of{
                (xc,xe)-> case xe==e of{
                    True-> case xc+c of{
                        0->xs;
                        ent->(xc+c,e):xs;
                    };
                    False-> case xe<e of{
                        True-> m:p;
                        False->x:(agregarMon m xs);
                    }
                }
            }
        }
    }
    

--2)
redPol :: Polinomio -> Polinomio
redPol = \p -> case p of{
    []->[];
    x:xs-> case redPol xs of{
        l-> agregarMon x l;
    }
}

--3)
sumPol :: Polinomio -> Polinomio -> Polinomio
sumPol = \p1 -> \p2 -> case p1 of{
    []->p2;
    x:xs-> redPol (p1 ++ p2);
}

--4)
mulPol :: Polinomio -> Polinomio -> Polinomio
mulPol =  \p1 -> \p2 -> case p1 of{
    
}

mulMon :: Monomio -> Monomio -> Monomio
mulMon = \m1 -> \m2 -> case m1 of{
    (0,e)->(0,0);
    (c,e)-> case m2 of{
        (0,e1)->(0,0);
        (c1,e1)->(c1*c,e+e1);
    }
}


--5)
derPol :: Polinomio -> Polinomio
derPol = undefined

--6)
evalPol :: Polinomio -> Int -> Int
evalPol = undefined

--7)
gradoPol::Polinomio -> Int
gradoPol = undefined
																	
																	
-- ======================
-- SHOW
-- ======================

--8)
showMon :: Monomio -> String
showMon = \m -> case m of{
    (0,e)-> "";
    (c,e)-> case e of{
        0-> show c;
        1-> case c==1 of{
            True-> "x";
            False-> case c==(-1) of{
                True-> "-x";
                False-> show c ++ "x";
            }
        };
        ent-> case c==1 of{
            True-> "x^"++ show e;
            False -> case c==(-1) of{
                True-> "-x^" ++ show e;
                False-> show c ++ "x^" ++ show e;
            }
        }
    }
}

--9)
showPol :: Polinomio -> String
showPol = \p -> case p of{
    []-> "";
    x:xs -> case showMon x of{
        ""-> showPol xs;
        s-> (showMon x) ++ auxiliarShowPol xs;
    }
    }

auxiliarShowPol :: Polinomio -> String
auxiliarShowPol = \p -> case p of{
    []->"";
    x:xs-> case x of{
        (c,e)-> case c<0 of{
            True-> showMon x ++ auxiliarShowPol xs;
            False-> "+" ++ showMon x ++ auxiliarShowPol xs;
        }
    }
}
