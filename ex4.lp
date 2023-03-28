#const n=4.
#const m=7.

% Nombre de couleurs
c(1..n).

% Nombre de sommets
s(1..m).

% Graphe de l'énoncé (e = edge = arete)
e(1,2).
e(1,3).
e(1,5).
e(2,3).
e(2,4).
e(2,6).
e(3,4).
e(3,5).
e(3,6).
e(4,5).
e(4,6).
e(5,6).
e(5,7).
e(6,7).

% associe une et une seule couleur à un sommet
1{couleur(X,I) : c(I)}1 :- s(X).

% si deux sommets adjacents ont la même couleur, on les retire des solutions possibles
:- couleur(X,I), couleur(Y,I), e(X,Y), c(I).
