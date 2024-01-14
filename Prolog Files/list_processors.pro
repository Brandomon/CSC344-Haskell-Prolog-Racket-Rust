% -----------------------------------------------------------------------
% -----------------------------------------------------------------------
% --- File: list_processors.pro
% --- Line: 
% -----------------------------------------------------------------------

% -----------------------------------------------------------------------
% Preliminary Code...
% -----------------------------------------------------------------------

% -----------------------------------------------------------------------
% --- first(List,"First") :: Outputs the "car" of the given list in
% the form "First" = ...

	first([H|_], H).

% -----------------------------------------------------------------------
% --- rest(List,"Rest") :: Outputs the "cdr" of the given list in 
% the form "Rest" = ...

	rest([_|T], T).

% -----------------------------------------------------------------------
% --- last(List,"Last") :: Outputs the last item of the given list
% in the form "Last" = ...

	last([H|[]], H).
	last([_|T], Result) :- last(T, Result).

% -----------------------------------------------------------------------
% --- Nth(N,List,"Element") :: Outputs the Nth item of the given list
% in the form "Element" = ...

	nth(0,[H|_],H).
	nth(N,[_|T],E) :- K is N - 1, nth(K,T,E).

% -----------------------------------------------------------------------
% --- Writelist(List) :: Outputs each element of the given list on a new line

	writelist([]).
	writelist([H|T]) :- write(H), nl, writelist(T).

% -----------------------------------------------------------------------
% --- sum(List,"Sum") :: Adds all of the elements of a list and outputs
% in the form "Sum" = ...

	sum([],0).
	sum([Head|Tail],Sum) :-
		sum(Tail,SumOfTail),
		Sum is Head + SumOfTail.

% -----------------------------------------------------------------------
% --- Add_first(Item,List,"Result") :: Adds item to first position of list
% and outputs "Result" = ...

	add_first(X,L,[X|L]).

% -----------------------------------------------------------------------
% --- Add_last(Item,List,"Result") :: Adds item to last position of list
% and outputs "Result" = ...

	add_last(X,[],[X]).
	add_last(X,[H|T],[H|TX]) :- add_last(X,T,TX).

% -----------------------------------------------------------------------
% --- Iota(N,IotaN) :: Creates in order number list of N length starting at 1

	iota(0,[]).
	iota(N,IotaN) :-
		K is N - 1,
		iota(K,IotaK),
		add_last(N,IotaK,IotaN).

% -----------------------------------------------------------------------
% --- Pick(List,"Item") :: Selects and outputs random item from list as "Item" = ...

	pick(L,Item) :-
		length(L,Length),
		random(0,Length,RN),
		nth(RN,L,Item).

% -----------------------------------------------------------------------
% --- Make_set(List,"Set") :: Outputs elements of list with more than one
% representation as "Set" = ...

	make_set([],[]).
	make_set([H|T],TS) :-
		member(H,T),
		make_set(T,TS).
	make_set([H|T],[H|TS]) :-
		make_set(T,TS).

% -----------------------------------------------------------------------
% Extended Code...
% -----------------------------------------------------------------------

% -----------------------------------------------------------------------
% --- product(Numlist,"Product") :: Takes a list of numbers as an input parameter 
% and produces the product of the numbers in the list as an output parameter and
% outputs the result as "Product" = ...

	product([],1).
	product([Head|Tail],Product) :-
		product(Tail,ProductOfTail),
		Product is Head * ProductOfTail.

% -----------------------------------------------------------------------
% --- factorial(Num,"Result") ::  Takes a positive integer as an input 
% parameter and produces the factorial of the given number as an output 
% parameter in the form "Result" = ...

	factorial(0,0).
	factorial(Num,Result) :- iota(Num,Iota),
	product(Iota,Product),
	Result is Product.
	
% -----------------------------------------------------------------------
% --- make_list(Num,Dataitem,"List") :: Takes a nonnegative integer as 
% its first input parameter, a data item as its second input parameter,
% and which produces a list consisting of the specified number of
% occurrences of the specified piece of data as its output parameter
% in the form "Result" = ...

	make_list(0,_,[]).
	make_list(Num,DataItem,List) :-
 		K is Num - 1,
 		make_list(K,DataItem,ListK),
 		add_last(DataItem,ListK,List).

	
% -----------------------------------------------------------------------
% --- but_first(List,"Result") :: Takes a non-empty list as input parameter
% and produces the “cdr” of the list as its output parameter in the form
% "Result" = ...

	but_first([],[]).
	but_first([_],[]).
	but_first([_|N],N).

	
% -----------------------------------------------------------------------
% --- but_last(List,"Result") ::  Takes a non-empty list as input parameter
% and produces the “rdc” of the list as its output parameter making use of
% the primitive predicate reverse two times in defining this predicate
% in the form "Result" = ...

	but_last([],[]).
	but_last([_],[]).
	but_last([H|T], Result) :-
 		reverse(T, [_|B]), reverse(B, Revlist), add_first(H,Revlist,Result).

	
% -----------------------------------------------------------------------
% --- is_palindrome(List) ::  Takes a list as its sole parameter and succeeds
% only if the list is a palindrome using first, last, but_first, and but_last
% while also using recursion. Outputs true or false.

	is_palindrome([]).
	is_palindrome([_]).
	is_palindrome(List) :-
		first(List,First), last(List,Last),
		First = Last,
		but_first(List,A), but_last(A,B),
		is_palindrome(B).

% -----------------------------------------------------------------------
% --- noun_phrase(List,"Phrase") ::  Produces a noun phrase of length three 
% consisting of the word “the” followed by an adjective selected at random
% from a list of six adjectives followed by a noun selected at random from
% a list of eight nouns in the form "Phrase" = ...

	noun_phrase(Phrase) :-
		pick([captivating,rude,zesty,wrathful,ordinary,joyous],Adj),
		pick([investment,instance,recipe,apple,president,solution,possibility,strategy],Noun),
		add_last(Adj,[the],Start), add_last(Noun,Start,Phrase).

% -----------------------------------------------------------------------
% --- sentence(List,"Sentence") ::  Produces a sentence consisting of a random
% noun phrase followed by a past tense verb followed by a noun phrase using
% the the tokennoun_phrase predicate as well as the pick predicate in the
% form “Sentence” = …

	sentence(Sentence) :-
		noun_phrase(NP1), 
		noun_phrase(NP2),
		pick([ate,assured,fixed,zapped,composed,justified,sketched],Verb),
		add_last(Verb,NP1,Temp),
		append(Temp,NP2,Sentence).
