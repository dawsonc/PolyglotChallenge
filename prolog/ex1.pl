rainy(today).
clear(tomorrow).

blue(Sky):-
  clear(Sky).

grey(Sky):-
  rainy(Sky).