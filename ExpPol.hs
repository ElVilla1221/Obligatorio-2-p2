{-# OPTIONS_GHC -fno-warn-tabs #-}
{-#LANGUAGE GADTs#-}
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Redundant lambda" #-}

module ExpPol where

import Polinomios
--ENTREGA DE DANTE PUERTO (360160) Y LUCAS VILLAMIL (352138)
-- ========================
-- EXPRESIONES POLINOMICAS
-- ========================

data ExPol where 
		Pol  :: Polinomio -> ExPol 
		Der  :: ExPol -> ExPol 
		Eval :: ExPol -> Int -> ExPol 
		Sum  :: [ExPol] -> ExPol 
		Prod :: [ExPol] -> ExPol 
				deriving Show

																	
--10) 
cantPol :: ExPol -> Int
cantPol =  \a -> case a of{
	Pol p-> 1;
	Der d-> cantPol d;
	Eval e i-> cantPol e;
	Sum xs-> sum (map cantPol xs);
	Prod xs-> sum (map cantPol xs);
}

--11)
cantx :: ExPol -> Int
cantx  = \a -> case a of{
	Pol p-> cantXEnPol p;
	Der d -> cantx d;
	Eval e i-> cantx e;
	Sum xs-> sum (map cantx xs);
	Prod xs-> sum (map cantx xs);
}

cantXEnPol :: Polinomio -> Int
cantXEnPol = \p -> case p of{
	[]->0;
	x:xs-> case (snd x)==0 of{
		True->cantXEnPol xs;
		False->1+cantXEnPol xs;
	}  
}

--12)
maxProd :: ExPol -> Int
maxProd  = \a -> case a of{
	Pol p->0;
	Der d-> maxProd d;
	Eval e i-> maxProd e;
	Sum xs-> maxLista (map maxProd xs);
	Prod xs -> max (length xs) (maxLista (map maxProd xs));
}

maxLista :: [Int] -> Int
maxLista = \l -> case l of{
	[]->0;
	x:xs-> max x (maxLista xs);
}


--13)
gradoEP :: ExPol -> Int
gradoEP = \a -> case a of{
	Pol p-> maxGradoPol p;
	Der d -> gradoEP d;
	Eval e i -> gradoEP e;
	Sum xs -> maxLista (map gradoEP xs);
	Prod xs-> maxLista (map gradoEP xs);
}

maxGradoPol :: Polinomio -> Int
maxGradoPol = \p -> case p of{
	[]->0;
	x:xs-> max (snd x) (maxGradoPol xs);
}
	
--14)	
calcEP :: ExPol -> Polinomio
calcEP = \a -> case a of{
	Pol p->p;
	Der d-> derPol (calcEP d);
	Eval e i-> ((evalPol (calcEP e) i),0):[];
	Sum xs-> sumLista (map calcEP xs);
	Prod xs -> multLista (map calcEP xs);
}

sumLista :: [Polinomio] -> Polinomio
sumLista = \l -> case l of{
	[]->[];
	x:xs-> sumPol x (sumLista xs);
}

multLista :: [Polinomio] -> Polinomio
multLista = \l -> case l of{
	[]->[(1,0)];
	x:xs-> mulPol x (multLista xs);
}
--15)
resultado :: ExPol -> String
resultado = \a -> showPol (calcEP a);

