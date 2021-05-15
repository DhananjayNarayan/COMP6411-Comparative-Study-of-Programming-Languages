class(human).
class(bladerunner).
class(android).
class(machine).
class(android2).

construction(bladerunner,string).
construction(bladerunner,default).
construction(android,int).
construction(android2,int).
construction(android2,default).

interface(behavior).
interface(behavior2).

defines(human,type,attribute,public).
defines(human,empathy,attribute,public).
defines(human,act,method,public).
defines(human,reason,method,public).
defines(human,hasempathy,method,public).

defines(bladerunner,type,attribute,public).
defines(bladerunner,rank,attribute,public).
defines(bladerunner,reason,method,public).

defines(machine,type,attribute,public).

defines(android,version,attribute,public).
defines(android,whatihave,method,public).
defines(android,whatineed,method,public).
defines(android,act,method,public).
defines(android,reason,method,public).

defines(android2,whatihave,method,public).
defines(android2,hasempathy,method,public).
defines(android2,hasmemories,method,public).

extends(bladerunner,human).
extends(android,machine).
extends(android2,android).

implements(human,behavior).
implements(machine,behavior).
implements(android2,behavior2).

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

% Rule 9
siblings(ListOfSiblings):-
findall([X,Y],(child(X,Z), child(Y,Z),not(X=Y)), Lst),
list_to_set(Lst,ListOfSiblings).
