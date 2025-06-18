# Informe sobre la Gramática en Prolog para Análisis Sintáctico
### Introducción

Este informe presenta una gramática en Prolog, basada en Definite Clause Grammars (DCG), diseñada para analizar la estructura sintáctica de oraciones en español. La gramática garantiza la concordancia en género y número entre determinantes, nombres y verbos, permitiendo generar y validar estructuras correctas.

### Objetivos del Código

•	Modelar la estructura sintáctica de oraciones simples en español.<br>
•	Garantizar la concordancia entre sintagmas nominales y verbales.<br>
•	Permitir el análisis y generación de frases correctas en Prolog.<br>
•	Servir de base para futuras extensiones con adjetivos, complementos y estructuras más complejas.<br>

### Descripción del Código

1. Oración (o/1)<br>
`o(o(SN,SV)) --> sn(SN,Gen,Num), sv(SV,Num).`<br>
•	Define una oración como la combinación de un Sintagma Nominal (SN) y un Sintagma Verbal (SV).<br>
•	La concordancia en número (Num) entre el sujeto y el verbo es esencial.<br>

2. Sintagma Nominal (sn/3)
`sn(sn(DET,N),Gen,Num) --> det(DET,Gen,Num), n(N,Gen,Num).`<br>
•	Compuesto por un Determinante (DET) y un Nombre (N).<br>
•	Ambos deben coincidir en género (Gen) y número (Num).<br>

3. Sintagma Verbal (sv/2)
`sv(sv(VT,SN),Num) --> vt(VT,Num), sn(SN,_Gen,_Num). sv(sv(VI),Num) --> vi(VI,Num).` <br>
•	Los verbos transitivos (VT) pueden ir acompañados de un objeto directo (SN).<br>
•	Los verbos intransitivos (VI) no requieren un complemento nominal.<br>

### Reglas Léxicas<br>
1. Determinantes (det/3)<br>
`det(det(X),f,sg) --> [X], {member(X, [la,una])}.`<br>
`det(det(X),f,pl) --> [X], {member(X, [las,unas])}.` <br>
`det(det(X),m_,sg) --> [X], {member(X, [el,un])}.`<br>
`det(det(X),m_,pl) --> [X], {member(X, [los,unos])}.` <br>
•	Definen artículos por género (f femenino, m_ masculino) y número (sg singular, pl plural).<br>

2. Verbos (vi/2, vt/2)<br>
`vi(vi(trabaja),sg) --> [trabaja]. vi(vi(trabajan),pl) --> [trabajan].` <br>
`vt(vt(cobra),sg) --> [cobra]. vt(vt(cobran),pl) --> [cobran].`<br>
•	Se incluyen verbos intransitivos (trabaja, trabajan) y transitivos (cobra, cobran).<br>
•	Se mantiene la concordancia con el sujeto en número (sg, pl).<br>

3. Nombres (n/3)<br>
`n(n(empleada),f,sg) --> [empleada].` <br>
`n(n(empleadas),f,pl) --> [empleadas].` <br>
`n(n(empleado),m_,sg) --> [empleado].` <br>
`n(n(empleados),m_,pl) --> [empleados].` <br>
`n(n(sueldo),m_,sg) --> [sueldo].` <br>
`n(n(sueldos),m_,pl) --> [sueldos].` <br>
•	Modela nombres en género (f femenino, m_ masculino) y número (sg, pl).<br>

### Funcionamiento
Para probar la gramática en Prolog, se pueden realizar consultas como:<br>

1. Generar la estructura sintáctica de una oración
`phrase(o(O), [la, empleada, trabaja]).`<br>
•	Resultado esperado:<br>
`O = o(sn(det(la), n(empleada)), sv(vi(trabaja)))`<br>
2. Verificar si una oración es válida<br>
`phrase(o(_), [los, empleados, cobran, los, sueldos]).`<br>
•	Resultado esperado: `true.`<br>

### Conclusión<br>
Este código en Prolog permite analizar la estructura sintáctica de oraciones en español, asegurando la concordancia de sus elementos. Puede expandirse con adjetivos, complementos circunstanciales y estructuras más complejas para cubrir un espectro más amplio del lenguaje natural.
El proyecto puede ser utilizado para aplicaciones en lingüística computacional y procesamiento del lenguaje natural.
