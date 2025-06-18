# Reglas de la oración
o(o(SN,SV)) --> sn(SN,Gen,Num), sv(SV,Num).

# Sintagma nominal
sn(sn(DET,N),Gen,Num) --> det(DET,Gen,Num), n(N,Gen,Num).

# Sintagma verbal
sv(sv(VT,SN),Num) --> vt(VT,Num), sn(SN,_Gen,_Num).
sv(sv(VI),Num) --> vi(VI,Num).

# Determinantes
det(det(X),f,sg) --> [X], {member(X, [la,una])}.
det(det(X),f,pl) --> [X], {member(X, [las,unas])}.
det(det(X),m_,sg) --> [X], {member(X, [el,un])}.
det(det(X),m_,pl) --> [X], {member(X, [los,unos])}.

# Verbos intransitivos
vi(vi(trabaja),sg) --> [trabaja].
vi(vi(trabajan),pl) --> [trabajan].

# Verbos transitivos
vt(vt(cobra),sg) --> [cobra].
vt(vt(cobran),pl) --> [cobran].

# Nombres
n(n(empleada),f,sg) --> [empleada].
n(n(empleadas),f,pl) --> [empleadas].
n(n(empleado),m_,sg) --> [empleado].
n(n(empleados),m_,pl) --> [empleados].
n(n(sueldo),m_,sg) --> [sueldo].
n(n(sueldos),m_,pl) --> [sueldos].