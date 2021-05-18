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


