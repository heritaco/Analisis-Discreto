% Programación Lógica

% Nombre: Heriberto Espino Montelongo
% Materia: Análisis Discreto
% Clave: O24-LDS1011-1
% Fecha: 21 de septiembre de 2024

% Realice un programa en PROLOG de un árbol genealógico.
% Defina a las personas que lo componen
% y las relaciones de parentesco más sencillas:
% padre(X,Y), madre(X,Y), hombre(X), mujer(X), diferente(X,Y).

% Úselas para definir otras relaciones:
% tía(X,Y), tío(X,Y), hermano(X,Y), hermana(X,Y),
% abuelo(X,Y),abuela(X,Y), prima(X,Y), primo(X,Y),
% ancestro(X,Y), descendiente(X,Y).
% Si es necesario definir otras relaciones auxiliares, hágalo.

% Genealogía de la familia de Borbón
% Desde Louis Duke of Bourgogne
% hasta Louis XVII 

% Personas
hombre(louis_duke_of_bourgogne).
hombre(louis_duke_of_brittany).
hombre(louis_xv).
hombre(louis_dauphin_of_france).
hombre(louis_xvi).
hombre(louis_xviii).
hombre(charles_x).
hombre(louis_joseph_of_france).
hombre(louis_xvii).
hombre(louis_xix).
hombre(charles_ferdinand).

mujer(marie_adelaide_of_savoy).
mujer(maria_leszczynska).
mujer(louis_elisabeth).
mujer(henriette_anne).
mujer(marie_josephe).
mujer(marie_adelaide).
mujer(victorie_louise).
mujer(sophie_philippine).
mujer(louise_marie).
mujer(marie_antoinette).
mujer(marie_therese).
mujer(marie_clotilde).
mujer(elisabeth_philippine).
mujer(marie_therese_charlote).
mujer(sophie_beatrice).
mujer(caroline_ferdinande).

% Relaciones padres
padre(louis_duke_of_bourgogne, louis_duke_of_brittany).
padre(louis_duke_of_bourgogne, louis_xv).

padre(louis_xv, louis_elisabeth).
padre(louis_xv, henriette_anne).
padre(louis_xv, louis_dauphin_of_france).
padre(louis_xv, marie_adelaide).
padre(louis_xv, victorie_louise).
padre(louis_xv, sophie_philippine).
padre(louis_xv, louise_marie).

padre(louis_dauphin_of_france, louis_xvi).
padre(louis_dauphin_of_france, louis_xviii).
padre(louis_dauphin_of_france, charles_x).
padre(louis_dauphin_of_france, marie_clotilde).
padre(louis_dauphin_of_france, elisabeth_philippine).

padre(louis_xvi, marie_therese_charlote).
padre(louis_xvi, louis_joseph_of_france).
padre(louis_xvi, louis_xvii).
padre(louis_xvi, sophie_beatrice).

padre(charles_x, louis_xix).
padre(charles_x, charles_ferdinand).

% Relaciones de madres
madre(M, C) :- esposa(M, P), padre(P, C).

% Relaciones de esposos
esposo(louis_duke_of_bourgogne, marie_adelaide_of_savoy).
esposo(louis_xv, marie_leszczynska).
esposo(louis_dauphin_of_france, marie_josephe).
esposo(louis_xvI, marie_antoinette).
esposo(charles_x, marie_therese).
esposo(charles_ferdinand, caroline_ferdinande).

esposa(M, P) :- esposo(P, M).

% Progenitor
progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).

% Relaciones de hijos e hijas
hijo(X, Y) :- hombre(X), progenitor(Y, X).
hija(X, Y) :- mujer(X), progenitor(Y, X).

% Relación de hermanos y hermanas
hermano(X, Y) :- hombre(X), progenitor(Z, X), progenitor(Z, Y), diferente(X, Y).
hermana(X, Y) :- mujer(X), progenitor(Z, X), progenitor(Z, Y), diferente(X, Y).

% Relación de abuelos y abuelas
abuelo(X, Y) :- hombre(X), progenitor(X, Z), progenitor(Z, Y).
abuela(X, Y) :- mujer(X), progenitor(X, Z), progenitor(Z, Y).

% Relación de tíos y tías
tio(X, Y) :- hombre(X), hermano(X, Z), progenitor(Z, Y).
tia(X, Y) :- mujer(X), hermana(X, Z), progenitor(Z, Y).

% Relación de primos y primas
primo(X, Y) :- hombre(X), progenitor(Z, X), tio(Z, Y).
prima(X, Y) :- mujer(X), progenitor(Z, X), tia(Z, Y).

% Relación de ancestros
ancestro(X, Y) :- progenitor(X, Y).
ancestro(X, Y) :- progenitor(X, Z), ancestro(Z, Y).

% Relación de descendientes
descendiente(X, Y) :- ancestro(Y, X).

% Relación de diferentes
diferente(X, Y) :- X \= Y.
