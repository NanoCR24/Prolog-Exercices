% Integrantes
% 305490093 - Alonso Usaga Bonilla
% 118760067 - Juan Pablo Cartín Esquivel
% 118780391 - Jefferson Sandí Ramírez
% EIF400 – Paradigmas de Programación – NRC 50989
% 2024-11-10 Proyecto #2 – Ejercicio #2.

subsecuencia(X, X1) :- nonvar(X), var(X1), !, X=X1.  
subsecuencia([], _).
subsecuencia([X|T], [X|T2]) :- subsecuencia(T, T2).
subsecuencia([X|T], [_|T2]) :- subsecuencia([X|T], T2).
