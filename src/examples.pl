# Cargar la gramática antes de ejecutar consultas
:- consult('grammar.pl').

# Ejemplos de análisis sintáctico
test_examples :- 
    phrase(o(O1), [la, empleada, trabaja]), 
    write('Ejemplo 1: '), writeln(O1),

    phrase(o(O2), [el, empleado, cobra, un, sueldo]), 
    write('Ejemplo 2: '), writeln(O2),

    phrase(o(O3), [los, empleados, cobran, los, sueldos]), 
    write('Ejemplo 3: '), writeln(O3).

# Consultas individuales
:- phrase(o(O), [la, empleada, trabaja]).
:- phrase(o(O), [los, empleados, cobran, los, sueldos]).
:- phrase(o(_), [el, empleado, cobra, un, sueldo]). % Solo verifica validez