subsecuencia(X, X1) :- nonvar(X), var(X1), !, X=X1.  
subsecuencia([], _).
subsecuencia([X|T], [X|T2]) :- subsecuencia(T, T2).
subsecuencia([X|T], [_|T2]) :- subsecuencia([X|T], T2).
