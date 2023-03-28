;;; LÉO PORTE TME 3
;;; diag_med.clp
(defrule my_init
        (initial-fact)
=>
	(watch facts)
	(watch rules)

	(assert (rougeur patient))
	(assert (peu_boutons patient))
	(assert (froid patient))
	(assert (yeux_douloureux patient))
	(assert (forte_fievre patient))
	(assert (amygdales_rouges patient))
	(assert (peau_qui_pele patient))
	(assert (peau_seche patient))
)


(defrule eruption_cutanee1
        (peu_boutons ?personne)
=>
	(assert (eruption_cutanee ?personne))
)

(defrule eruption_cutanee2
        (bcp_boutons ?personne)
=>
	(assert (eruption_cutanee ?personne))
)

(defrule exantheme1
        (eruption_cutanee ?personne)
=>
	(assert (exantheme ?personne))
)

(defrule exantheme2
        (rougeur ?personne)
=>
	(assert (exantheme ?personne))
)

(defrule febrile1
        (forte_fievre ?personne)
=>
	(assert (febrile ?personne))
)

(defrule febrile2
        (froid ?personne)
=>
	(assert (febrile ?personne))
)

(defrule suspect1
        (amygdales_rouges ?personne)
	(rougeur ?personne)
	(peau_qui_pele ?personne)
=>
	(assert (suspect ?personne))
)

(defrule rougeole1
        (febrile ?personne)
	(yeux_douloureux ?personne)
	(exantheme ?personne)
=>
	(assert (rougeole ?personne))
)

(defrule rougeole2
	(suspect ?personne)
	(forte_fievre ?personne)
=>
	(assert (rougeole ?personne))
)

(defrule pas_rougeole1
	(peu_boutons ?personne)
	(forte_fievre ?personne)
=>
	(assert (not_rougeole ?personne))
)

(defrule possible_var_rub1
	(not_rougeole ?personne)
=>
	(assert (possible_var_rub ?personne))
)

(defrule douleur1
	(yeux_douloureux ?personne)
=>
	(assert (douleur ?personne))
)

(defrule douleur2
	(dos_douloureux ?personne)
=>
	(assert (douleur ?personne))
)

(defrule grippe1
	(dos_douloureux ?personne)
	(febrile ?personne)
=>
	(assert (grippe ?personne))
)

(defrule varicelle1
	(fortes_demangeaisons ?personne)
	(pustules ?personne)
=>
	(assert (varicelle ?personne))
)

(defrule rubeole1
	(peau_seche ?personne)
	(inflamm_ganglions ?personne)
	(not (pustules ?personne))
	(not (froid ?personne))
=>
	(assert (rubeole ?personne))
)
