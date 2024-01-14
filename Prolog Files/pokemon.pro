% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- File: pokemon.pro
% --- Line: Just a few facts about pokemon
% -----------------------------------------------------------------------

% -----------------------------------------------------------------------
% --- cen(P) :: Pokemon P was "creatio ex nihilo"

cen(pikachu).
cen(bulbasaur).
cen(caterpie).
cen(charmander).
cen(vulpix).
cen(poliwag).
cen(squirtle).
cen(staryu).

% -----------------------------------------------------------------------
% --- evolves(P,Q) :: Pokemon P directly evolves to pokemon Q

evolves(pikachu,raichu).
evolves(bulbasaur,ivysaur).
evolves(ivysaur,venusaur).
evolves(caterpie,metapod).
evolves(metapod,butterfree).
evolves(charmander,charmeleon).
evolves(charmeleon,charizard).
evolves(vulpix,ninetails).
evolves(poliwag,poliwhirl).
evolves(poliwhirl,poliwrath).
evolves(squirtle,wartortle).
evolves(wartortle,blastoise).
evolves(staryu,starmie).

% -----------------------------------------------------------------------
% --- pokemon(name(N),T,hp(H),attach(A,D)) :: There is a pokemon with
% --- name N, type T, hit point value H, and attach named A that does
% --- damage D.

pokemon(name(pikachu), electric, hp(60), attack(gnaw, 10)).
pokemon(name(raichu), electric, hp(90), attack(thunder-shock, 90)).

pokemon(name(bulbasaur), grass, hp(40), attack(leech-seed, 20)).
pokemon(name(ivysaur), grass, hp(60), attack(vine-whip, 30)).
pokemon(name(venusaur), grass, hp(140), attack(poison-powder, 70)).

pokemon(name(caterpie), grass, hp(50), attack(gnaw, 20)).
pokemon(name(metapod), grass, hp(70), attack(stun-spore, 20)).
pokemon(name(butterfree), grass, hp(130), attack(whirlwind, 80)).

pokemon(name(charmander), fire, hp(50), attack(scratch, 10)).
pokemon(name(charmeleon), fire, hp(80), attack(slash, 50)).
pokemon(name(charizard), fire, hp(170), attack(royal-blaze, 100)).

pokemon(name(vulpix), fire, hp(60), attack(confuse-ray, 20)).
pokemon(name(ninetails), fire, hp(100), attack(fire-blast, 120)).

pokemon(name(poliwag), water, hp(60), attack(water-gun, 30)).
pokemon(name(poliwhirl), water, hp(80), attack(amnesia, 30)).
pokemon(name(poliwrath), water, hp(140), attack(dashing-punch, 50)).

pokemon(name(squirtle), water, hp(40), attack(bubble, 10)).
pokemon(name(wartortle), water, hp(80), attack(waterfall, 60)).
pokemon(name(blastoise), water, hp(140), attack(hydro-pump, 60)).

pokemon(name(staryu), water, hp(40), attack(slap, 20)).
pokemon(name(starmie), water, hp(60), attack(star-freeze, 20)).

% -----------------------------------------------------------------------
% Rules ...
% -----------------------------------------------------------------------

% -----------------------------------------------------------------------
% --- display_names :: list the names of all of the pokemon

	display_names :- pokemon(name(Name),_,_,_), write(Name), nl, fail.
	display_names.

% -----------------------------------------------------------------------
% --- display_attacks :: list the attacks of all of the pokemon

	display_attacks :- pokemon(_,_,_,attack(Name,_)), write(Name), nl, fail.
	display_attacks.

% -----------------------------------------------------------------------
% --- powerful(Name) :: succeeds if the pokemon's attack yields over 55 damage

	powerful(Name) :- pokemon(name(Name),_,_,attack(_,Damage)), Damage > 55.

% -----------------------------------------------------------------------
% --- tough(Name) :: succeeds if the pokemon's HP is greater or equal to 100

	tough(Name) :- pokemon(name(Name),_,hp(HP),_), HP >= 100.

% -----------------------------------------------------------------------
% --- type(Name,Type) :: succeeds if the pokemon is of the specified type

	type(Name,Type) :- pokemon(name(Name),Type,_,_).

% -----------------------------------------------------------------------
% --- dump_kind(T) :: displays all information on all pokemon of the given type

	dump_kind(T) :- listing(pokemon(_,T,_,_)).

% -----------------------------------------------------------------------
% --- display_cen :: displays names of all "creatio ex nihilo" pokemon

	display_cen :- cen(Name), write(Name), nl, fail.
	display_cen.

%------------------------------------------------------------------------
% --- family(Name1) :: displays names of all related pokemon to a presumed CEN pokemon

%	family(Name1) :- evolves(Name1,Name2), write(Name1), write(' '), write(Name2), evolves(Name2,Name3), write(' '), write(Name3).
% -- Returns true but gives singleton variable warning with the addition of the line below
%	family(Name1).
	
	family(Name1) :-
		evolves(Name1, Name2),
		evolves(Name2, Name3),
		write(Name1), write(' '), write(Name2), write(' '), write(Name3).
	family(Name1) :-
		evolves(Name1, Name2),
		write(Name1), write(' '), write(Name2).

%------------------------------------------------------------------------
% --- families :: displays all families of pokemon

	families :- cen(Name1), evolves(Name1,Name2), nl, write(Name1), write(' '), write(Name2), evolves(Name2,Name3), write(' '), write(Name3), fail.
	families.

%------------------------------------------------------------------------
% --- lineage(Name1) :: displays all information on the family of the given pokemon

%	lineage(Name1) :-
%		pokemon(name(Name1),_,_,_),
%		listing(pokemon(name(Name1),_,_,_)),
%		evolves(Name1,Name2),
%		listing(pokemon(name(Name2),_,_,_)),
%		evolves(Name2,Name3),
%		listing(pokemon(name(Name3),_,_,_)).
% -- Returns true but gives singleton variable warning with the addition of the line below
%	lineage(Name1).

% Code that works properly from Victor Lockwood's Programming Assignment
lineage(N) :-
	evolves(N, X),
	evolves(X, Y),
	pokemon(name(N), T1, HP1, A1),
	pokemon(name(X), T2, HP2, A2),
	pokemon(name(Y), T3, HP3, A3),
	write(pokemon(name(N), T1, HP1, A1)), nl,
	write(pokemon(name(X), T2, HP2, A2)), nl,
	write(pokemon(name(Y), T3, HP3, A3)).
lineage(N) :-
	evolves(N, X),
	pokemon(name(N), T1, HP1, A1),
	pokemon(name(X), T2, HP2, A2),
	write(pokemon(name(N), T1, HP1, A1)), nl,
	write(pokemon(name(X), T2, HP2, A2)).
lineage(N) :-
	pokemon(name(N), T, HP, A),
	write(pokemon(name(N), T, HP, A)).