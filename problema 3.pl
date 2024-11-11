% Integrantes
% 305490093 - Alonso Usaga Bonilla
% 118760067 - Juan Pablo Cartín Esquivel
% 118780391 - Jefferson Sandí Ramírez
% EIF400 – Paradigmas de Programación – NRC 50989
% 2024-11-10 Proyecto #2 – Ejercicio #2.

invertir(Valor, Lista, X):-
    esta(Valor, Lista,_),
    separar(Valor, Lista, Antes, Despues),
    reverse(Antes, AntesInvertido),
    append(AntesInvertido, Despues, X).

separar(Valor, [Valor | Resto], [], [Valor | Resto]).
separar(Valor, [Cabeza |Cola ], [Cabeza | Antes], Despues) :-
    separar(Valor, Cola, Antes, Despues).

esta(Value, [Value | _], Value).
esta(Value, [_ | MENOSindexCERO], X) :-
    esta(Value, MENOSindexCERO, X).

mostrar_lista([]).
mostrar_lista([Cabeza | Cola]) :-
    write(Cabeza), write(' '),
    mostrar_lista(Cola).

%Función principal para ordenar
ordenar(Lista, Ordenada) :-
    ordenar_aux(Lista, [], OrdenadaParcial),
    (   de_mayor_a_menor(OrdenadaParcial) ->
        Ordenada = OrdenadaParcial  % Si la lista está ordenada DONE
    ;   ordenar(OrdenadaParcial, Ordenada)  % Si no se llama a ordenar otra vez
    ).

% Caso base:Solo dos numeros entonces los ponemos en orden
ordenar_aux([X, Y], Acc, Ordenada) :-
    (X =< Y -> append(Acc, [X, Y], Ordenada) ; append(Acc, [Y, X], Ordenada)).

% Caso recursivo: Mi elemento pasado es mayor ? Si es asi se invierte en
% el siguinte elemento y se hace pop al primer elemento, por ende
% poniendo un elemento que es definitivamnete menor al inicio
ordenar_aux([A, B | Resto], Acc, Ordenada) :-
    (A =< B ->
        % Si esta en orden continii
        append(Acc, [A], NuevoAcc),
        ordenar_aux([B | Resto], NuevoAcc, Ordenada)
    ;
        % Si no aplicar invertir
        siguiente_elemento(B, [A, B | Resto], Siguiente),
        invertir(Siguiente, [A, B | Resto], NuevaLista),
        [NuevoElemento | NuevaListaRestante] = NuevaLista,
        append(Acc, [NuevoElemento], NuevoAcc),
        ordenar_aux(NuevaListaRestante, NuevoAcc, Ordenada)
    ).


% Caso: Si encontramos el Valor, devolvemos el siguiente elemento en Siguiente
siguiente_elemento(Valor, [Valor, Siguiente | _], Siguiente).

% Caso recursivo: Si no hemos encontrado el Valor, seguimos buscando en el resto de la lista
siguiente_elemento(Valor, [_ | Cola], Siguiente) :-
    siguiente_elemento(Valor, Cola, Siguiente).

% Verifica si una lista esta en orden
de_mayor_a_menor([_]).
de_mayor_a_menor([X, Y | Resto]) :-
    X =< Y,
    de_mayor_a_menor([Y | Resto]).


%Nota para usuarios
% En caso de que la lista de numeros sea de una longitud conciderable,
% llame a la funcion ordenar de la siguinte manera:
%
% ordenar([9, 2, 5, 19, 3, 4, 20, 13, 17, 7, 18, 16, 1, 11, 10, 6, 8, 15, 12, 14], ListaOrdenada), mostrar_lista(ListaOrdenada).
%
% para asi ver el resultado en su totalidad
