% Integrantes
% 305490093 - Alonso Usaga Bonilla
% 118760067 - Juan Pablo Cartín Esquivel
% 118780391 - Jefferson Sandí Ramírez
% EIF400 – Paradigmas de Programación – NRC 50989
% 2024-11-10 Proyecto #2 – Ejercicio #2.

% Predicado principal que genera secuencias irreducibles
secuencia(N, Conjunto, Secuencia) :-
    length(Secuencia, N),
    generar_secuencia(Secuencia, Conjunto),
    es_irreducible(Secuencia).

% Genera una secuencia de longitud N
generar_secuencia([], _).
generar_secuencia([X|Resto], Conjunto) :-
    member(X, Conjunto),
    generar_secuencia(Resto, Conjunto).

% Verifica si una secuencia es irreducible
es_irreducible(Secuencia) :-
    \+ tiene_subsecuencia_repetida(Secuencia).

% Verifica si hay subsecuencias repetidas adyacentes
tiene_subsecuencia_repetida(Secuencia) :-
    length(Secuencia, Len),
    between(1, Len, SubLen), 
    subsecuencia_repetida(Secuencia, SubLen).

% Busca una subsecuencia repetida
subsecuencia_repetida(Secuencia, SubLen) :-
    append(Inicio, Resto, Secuencia),
    length(Sub1, SubLen),
    append(Sub1, Resto1, Resto),
    length(Sub2, SubLen),
    append(Sub2, _, Resto1),
    Sub1 = Sub2,  
    Sub1 \= [].   

between(L, H, L) :- L =< H.
between(L, H, N) :-
   L < H,
    L1 is L + 1,
    between(L1, H, N).
