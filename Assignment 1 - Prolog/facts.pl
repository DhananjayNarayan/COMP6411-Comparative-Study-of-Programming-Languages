class('Human').
class('Bladerunner').
class('Android').
class('Machine').
class('Android2').

construction('Bladerunner',string).
construction('Bladerunner',default).
construction('Android',int).
construction('Android2',int).
construction('Android2',default).


interface('Behavior').
interface('Behavior2').

defines('Human',type,attribute,public).
defines('Human',empathy,attribute,public).
defines('Human','act()',method,public).
defines('Human','reason()',method,public).
defines('Human','hasEmpathy()',method,public).

defines('Bladerunner',type,attribute,public).
defines('Bladerunner',rank,attribute,public).
defines('Bladerunner','reason()',method,public).

defines('Machine',type,attribute,public).

defines('Android',version,attribute,public).
defines('Android','whatIhave()',method,public).
defines('Android','whatIneed()',method,public).
defines('Android','act()',method,public).
defines('Android','reason()',method,public).

defines('Android2','whatIhave()',method,public).
defines('Android2','hasEmpathy()',method,public).
defines('Android2','hasMemories()',method,public).

defines('Behavior2',empathy,attribute,public).
defines('Behavior2',memories,attribute,public).
defines('Behavior2','hasEmpathy()',method,public).
defines('Behavior2','hasMemories()',method,public).

defines('Behavior','act()',method,public).
defines('Behavior','reason()',method,public).

extends('Bladerunner','Human').
extends('Android','Machine').
extends('Android2','Android').

implements('Human','Behavior').
implements('Machine','Behavior').
implements('Android2','Behavior2').

% Rule 1
empty_class(Type) :-
    class(Type),
    findall(Type,defines(Type,_,attribute,_),L1),
    findall(Type,defines(Type,_,method,_),L2),
    length(L1,N1),
    length(L2,N2),
    N1 == 0,
    N2 == 0.

% Rule 2
lazy_class(Type) :-
 class(Type),
 findall(Type, defines(Type,_,method,_), L),
 length(L, N),
 N == 1.

% Rule 3
data_type(Type):-
    class(Type),
    findall(Type,defines(Type,_,attribute,_),L1),
    findall(Type,defines(Type,_,method,_),L2),
    length(L1,N1),
    length(L2,N2),
    N1 >= 1,
    N2 == 0.

% Rule 4
child(Set) :-
findall([F,G], extends(F, G);implements(F,G), Lst),
list_to_set(Lst, Set).

% Rule 5
child(X,Y) :- extends(X,Y);implements(X,Y).

% Rule 6
ancestor(X, Y) :- child(Y, X).
ancestor(X,Y) :- child(Z,X),ancestor(Z,Y).

% Rule 7
state_of(Type,State):-
findall(X,
       (defines(Type,X,attribute,_);
           (ancestor(Y,Type),defines(Y,X,attribute,_))),
        State).

% Rule 8
interface_of(Type,Interface):-
    findall(X,(defines(Type,X,method,_);
               (  ancestor(Y,Type), defines(Y,X,method,_))),L1),
    findall(X,(implements(Type,Y),defines(Y,X,method,_)),L2),
    subset(L2,L1),
    con(L1,L2,L3),
    list_to_set(L3,Interface).
% concat fn
 con([],L1,L1).
 con([X|Tail],L2,[X|Tail1]):- con(Tail,L2,Tail1).

% Rule 9
siblings(ListOfSiblings):-
findall([X,Y],(child(X,Z), child(Y,Z),not(X=Y)), Lst),
list_to_set(Lst,ListOfSiblings).

% Rule 10
instantiated_polymorphically(Type):-
    extends(Type,_).

% Rule 11
is_type(Type):-
    class(Type);
    interface(Type).
root(Type):-
       is_type(Type),
       not(child(Type,_)).

% Rule 12
provides_interface(Type,L):-
    findall(X,implements(X,Type),L).
%    findall(X,)




