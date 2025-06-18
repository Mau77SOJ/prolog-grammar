# Informe sobre la Gramática en Prolog para Análisis Sintáctico
### Introducción

Este informe presenta una gramática en Prolog, basada en Definite Clause Grammars (DCG), diseñada para analizar la estructura sintáctica de oraciones en español. La gramática garantiza la concordancia en género y número entre determinantes, nombres y verbos, permitiendo generar y validar estructuras correctas.

### Objetivos del Código

•	Modelar la estructura sintáctica de oraciones simples en español.
•	Garantizar la concordancia entre sintagmas nominales y verbales.
•	Permitir el análisis y generación de frases correctas en Prolog.
•	Servir de base para futuras extensiones con adjetivos, complementos y estructuras más complejas.

### Descripción del Código

1. Oración (o/1)
`o(o(SN,SV)) --> sn(SN,Gen,Num), sv(SV,Num).`
•	Define una oración como la combinación de un Sintagma Nominal (SN) y un Sintagma Verbal (SV).
•	La concordancia en número (Num) entre el sujeto y el verbo es esencial.

2. Sintagma Nominal (sn/3)
`sn(sn(DET,N),Gen,Num) --> det(DET,Gen,Num), n(N,Gen,Num).`
•	Compuesto por un Determinante (DET) y un Nombre (N).
•	Ambos deben coincidir en género (Gen) y número (Num).

3. Sintagma Verbal (sv/2)
`sv(sv(VT,SN),Num) --> vt(VT,Num), sn(SN,_Gen,_Num). sv(sv(VI),Num) --> vi(VI,Num).` 
•	Los verbos transitivos (VT) pueden ir acompañados de un objeto directo (SN).
•	Los verbos intransitivos (VI) no requieren un complemento nominal.

### Reglas Léxicas
1. Determinantes (det/3)
`det(det(X),f,sg) --> [X], {member(X, [la,una])}.`
`det(det(X),f,pl) --> [X], {member(X, [las,unas])}.` 
`det(det(X),m_,sg) --> [X], {member(X, [el,un])}.`
`det(det(X),m_,pl) --> [X], {member(X, [los,unos])}.` 
•	Definen artículos por género (f femenino, m_ masculino) y número (sg singular, pl plural).

2. Verbos (vi/2, vt/2)
`vi(vi(trabaja),sg) --> [trabaja]. vi(vi(trabajan),pl) --> [trabajan].` 
`vt(vt(cobra),sg) --> [cobra]. vt(vt(cobran),pl) --> [cobran].`
•	Se incluyen verbos intransitivos (trabaja, trabajan) y transitivos (cobra, cobran).
•	Se mantiene la concordancia con el sujeto en número (sg, pl).

3. Nombres (n/3)
`n(n(empleada),f,sg) --> [empleada].` 
`n(n(empleadas),f,pl) --> [empleadas].` 
`n(n(empleado),m_,sg) --> [empleado].` 
`n(n(empleados),m_,pl) --> [empleados].` 
`n(n(sueldo),m_,sg) --> [sueldo].` 
`n(n(sueldos),m_,pl) --> [sueldos].` 
•	Modela nombres en género (f femenino, m_ masculino) y número (sg, pl).

### Funcionamiento
Para probar la gramática en Prolog, se pueden realizar consultas como:

1. Generar la estructura sintáctica de una oración
`phrase(o(O), [la, empleada, trabaja]).`

•	Resultado esperado:

`O = o(sn(det(la), n(empleada)), sv(vi(trabaja)))`
2. Verificar si una oración es válida

`phrase(o(_), [los, empleados, cobran, los, sueldos]).`
•	Resultado esperado: `true.`

### Conclusión
Este código en Prolog permite analizar la estructura sintáctica de oraciones en español, asegurando la concordancia de sus elementos. Puede expandirse con adjetivos, complementos circunstanciales y estructuras más complejas para cubrir un espectro más amplio del lenguaje natural.
El proyecto puede ser utilizado para aplicaciones en lingüística computacional y procesamiento del lenguaje natural.