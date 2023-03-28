% Nationalités
% 1 : Britannique
% 2 : Suédois
% 3 : Danois
% 4 : Norvégien
% 5 : Allemand

% Maisons (couleurs)
% 1 : Rouge
% 2 : Vert
% 3 : Blanche
% 4 : Jaune
% 5 : Bleue

% Animaux
% 1 : Chien
% 2 : Oiseaux
% 3 : Chat
% 4 : Chevaux
% 5 : Poisson

% Cigarettes
% 1 : Pall Mall
% 2 : Dunhill
% 3 : Blend
% 4 : Bluemaster
% 5 : Princess

% Boissons
% 1 : Thé
% 2 : Café
% 3 : Lait
% 4 : Bière
% 5 : Eau

pos(1..5).
nat(1..5).
maison(1..5).
boisson(1..5).
cigarette(1..5).
animal(1..5).


% chaque maison a un seul occupant d'une certaine nationalité
1{vitdans(N,M) : nat(N)}1 :- maison(M).
% deux nationalités ne vivent pas dans la même maison
:- vitdans(N,M1), vitdans(N,M2), nat(N), maison(M1 ; M2), M1 != M2.

% chaque nationalité boit une et une seule boisson
1{boit(N,B) : nat(N)}1 :- boisson(B).
% deux nationalités n'ont pas la même boisson fétiche
:- boit(N,B1), boit(N,B2), nat(N), boisson(B1), boisson(B2), B1 != B2.

% chaque nationalité fume une et une seule marque de cigarettes
1{fume(N,C) : nat(N)}1 :- cigarette(C).
% deux nationalités n'ont pas la même marque de cigarettes fétiche
:- fume(N,C1), fume(N,C2), nat(N), cigarette(C1), cigarette(C2), C1 != C2.

% chaque nationalité garde un et un seul animal
1{garde(N,A) : nat(N)}1 :- animal(A).
% deux nationalités n'ont pas le même animal fétiche
:- garde(N,A1), garde(N,A2), nat(N), animal(A1), animal(A2), A1 != A2.

% position de la maison
1{adresse(M,P) : maison(M)}1 :- pos(P).
% deux maisons ne peuvent pas avoir la même position
:- adresse(M,P1), adresse(M,P2), maison(M), pos(P1), pos(P2), P1 != P2.


% Le Britannique vit dans la maison rouge
vitdans(1,1).

% Le Suédois garde un chien
garde(2,1).

% Le Danois boit du thé
boit(3,1).

% Maison verte gauche de la maison blanche
adresse(2,P1) :- adresse(3,P2), pos(P1), pos(P2), P2 == P1+1.

% Proprio maison verte boit du café
boit(N,2) :- vitdans(N,2).

% Fumeur de Pall Mall possède oiseaux
garde(N,2) :- fume(N,1).

% Proprio maison jaune fume Dunhill
fume(N,2) :- vitdans(N,4).

% Maison au centre boit du lait
boit(N,3) :- vitdans(N,M), adresse(M,3).

% Norvégien vit dans première maison
vitdans(4,M) :- adresse(M,1), maison(M).

% Fumeur de Blend vit à côté de celle qui possède des chats
:- fume(N,3), vitdans(N,M), adresse(M,P1), adresse(W,P2), vitdans(L,W), garde(L,3), P2 != P1+1, P2 != P1-1.

% Possédeur de chevaux à côté du fumeur de Dunhill
:- garde(N,4), vitdans(N,M), adresse(M,P1), adresse(W,P2), vitdans(L,W), fume(L,2), P2 != P1+1, P2 != P1-1.

% Fumeur de Bluemaster boit bière
fume(N,4) :- boit(N,4).

% Allemand fume Princess
fume(5,5).

% Norvégien vit à côté de la maison bleue
:- vitdans(4,M), adresse(M,P1), adresse(5,P2), P2 != P1+1, P2 != P1-1.

% Fumeur Blend à côté de buveur d'eau
:- fume(N,3), vitdans(N,M), adresse(M,P1), adresse(W,P2), vitdans(L,W), boit(L,5), P2 != P1+1, P2 != P1-1.


% on obtient garde(5,5) : l'allemand possède les poissons
