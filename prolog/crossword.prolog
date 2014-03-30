word(astante,  a,s,t,a,n,t,e).
word(astoria,  a,s,t,o,r,i,a).
word(baratto,  b,a,r,a,t,t,o).
word(cobalto,  c,o,b,a,l,t,o).
word(pistola,  p,i,s,t,o,l,a).
word(statale,  s,t,a,t,a,l,e).

crossword(D1, D2, D3, A1, A2, A3) :-
  word(D1, _, D1_1, _, D1_2, _, D1_3, _),
  word(D2, _, D2_1, _, D2_2, _, D2_3, _),
  word(D3, _, D3_1, _, D3_2, _, D3_3, _),

  word(A1, _, D1_1, _, D2_1, _, D3_1, _),
  word(A2, _, D1_2, _, D2_2, _, D3_2, _),
  word(A3, _, D1_3, _, D2_3, _, D3_3, _).