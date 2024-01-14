% ---------------------------------------------------------------------------
% File: map_coloring.pro
% Program to find a 4 color map rendering for the given task 1 map.
% The colors used will be red, blue, green, and orange.
% The standard for abbrieviations used to stand for the shapes are given
% in the format of an abbreviation of the shape in the form of SQ for square
% or TRPZ for trapezoid, ending with a number signifying the position of
% shape within the ring starting at the 12 o'clock position within the outer
% layer ring of the given map, increasing numbers making our way towards the center.

% ---------------------------------------------------------------------------
% different(X,Y) :: X is not equal to Y

different(red,blue).
different(red,green).
different(red,orange).
different(green,blue).
different(green,orange).
different(green,red).
different(blue,green).
different(blue,orange).
different(blue,red).
different(orange,blue).
different(orange,green).
different(orange,red).

% ---------------------------------------------------------------------------
% coloring(SQ1,SQ2,TRPZ1,TRPZ2,TRPZ3,TRPZ4,TRPZ5,TRPZ6,TRPZ7,TRPZ8,TRPZ9,TRPZ10,TRPZ11,TRPZ12,SQ3,SQ4,SQ5,SQ6). :: 
% The shapes within the given map represented by a shape abbrieviation and a number signifying the shape within 
% the ring starting at the 12 o'clock position of the outer most layer are colored so that none of the shapes 
% sharing a border are the same color.

coloring(SQ1,SQ2,TRPZ1,TRPZ2,TRPZ3,TRPZ4,TRPZ5,TRPZ6,TRPZ7,TRPZ8,TRPZ9,TRPZ10,TRPZ11,TRPZ12,SQ3,SQ4,SQ5,SQ6) :-
	different(SQ1, SQ2),
	different(SQ2, TRPZ1),
	different(SQ2, TRPZ2),
	different(SQ2, TRPZ3),
	different(SQ2, TRPZ4),
	different(TRPZ1, TRPZ2),
	different(TRPZ2, TRPZ3),
	different(TRPZ3, TRPZ4),
	different(TRPZ4, TRPZ1),
	different(TRPZ1, TRPZ5),
	different(TRPZ1, TRPZ12),
	different(TRPZ2, TRPZ6),
	different(TRPZ2, TRPZ7),
	different(TRPZ3, TRPZ8),
	different(TRPZ3, TRPZ9),
	different(TRPZ4, TRPZ10),
	different(TRPZ4, TRPZ11),
	different(TRPZ5, TRPZ6),
	different(TRPZ6, TRPZ7),
	different(TRPZ7, TRPZ8),
	different(TRPZ8, TRPZ9),
	different(TRPZ9, TRPZ10),
	different(TRPZ10, TRPZ11),
	different(TRPZ11, TRPZ12),
	different(TRPZ12, TRPZ5),
	different(TRPZ5, SQ3),
	different(TRPZ6, SQ3),
	different(TRPZ7, SQ4),
	different(TRPZ8, SQ4),
	different(TRPZ9, SQ5),
	different(TRPZ10, SQ5),
	different(TRPZ11, SQ6),
	different(TRPZ12, SQ6),
	different(SQ3, SQ4),
	different(SQ4, SQ5),
	different(SQ5, SQ6),
	different(SQ6, SQ1).