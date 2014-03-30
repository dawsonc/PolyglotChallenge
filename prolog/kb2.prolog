lots_of_math(calculus).

emotional(people).

complicated(X) :- 
  emotional(X).
complicated(X) :-
  lots_of_math(X).

