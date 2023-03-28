#const ne=18.
#const ns=17.
#const nj=2*ns.

equipe(1..ne).
jour(1..nj).

#hide equipe/1.
#hide jour/1.

#show match/3.

% tous les matchs possibles.
1{match(D,E,J) : equipe(D), jour(J)}1 :- jour(J),equipe(D),equipe(E), D != E.

% un seul match possible par journée (domicile ou extérieur) pour chaque équipe
:- match(D,E,J), match(D,F,J), E != F.
:- match(D,E,J), match(F,E,J), D != F.

% rencontre à domicile ET à l'extérieur
match(D,E,J1) :- match(E,D,J2), equipe(D ; E), jour(J1 ; J2), J1 != J2.

% deux matchs identiques ne peuvent avoir lieu
:- match(D,E,J1), match(D,E,J2), J1 != J2.
