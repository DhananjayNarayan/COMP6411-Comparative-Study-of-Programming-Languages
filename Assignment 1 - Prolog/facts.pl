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
defines(human,hasEmpathy,method,public).

defines(bladerunner,type,attribute,public).
defines(bladerunner,rank,attribute,public).
defines(bladerunner,reason,method,public).

defines(machine,type,attribute,public).

defines(android,version,attribute,public).
defines(android,whatIhave,method,public).
defines(android,whatIneed,method,public).
defines(android,act,method,public).
defines(android,reason,method,public).

defines(android2,whatIhave,method,public).
defines(android2,hasEmpathy,method,public).
defines(android2,hasMemories,method,public).

defines(behavior2,empathy,attribute,public).
defines(behavior2,memories,attribute,public).
defines(behavior2,hasEmpathy,method,public).
defines(behavior2,hasMemories,method,public).

defines(behavior,act,method,public).
defines(behavior,reason,method,public).

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

% Rule 7
state_of(Type,State):-
findall(X,
        (defines(Type,X,attribute,_);
           (extends(Type,Y),defines(Y,X,attribute,_));
           (implements(Type,Z),defines(Z,X,attribute,_))),
        State).

% Rule 8
interface_of(Type,Interface):-
    findall(X,(defines(Type,X,method,_);
               (   extends(Type,Y), defines(Y,X,method,_))),L1),
    findall(X,(implements(Type,Y),defines(Y,X,method,_)),L2),
    subset(L2,L1),
    con(L1,L2,L3),
    list_to_set(L3,Interface).
% concat fn
 con([],L1,L1).
 con([X|Tail],L2,[X|Tail1]):- con(Tail,L2,Tail1).
% list-equalTo fn
%same([], []).
%same([H1|R1], [H2|R2]):-
   % H1 = H2,
   % same(R1, R2).


% Rule 9
siblings(ListOfSiblings):-
findall([X,Y],(child(X,Z), child(Y,Z),not(X=Y)), Lst),
list_to_set(Lst,ListOfSiblings).








