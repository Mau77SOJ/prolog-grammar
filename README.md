# prolog-grammar
Gramática en Prolog para Análisis Sintáctico
Este proyecto implementa una gramática en Prolog basada en DCG, modelando la concordancia de género y número en oraciones en español.
Estructura del repositorio:
- Carpeta "src": Código fuente (grammar.pl, examples.pl)
- Carpeta "docs": Documentación (informe.md)
- Carpeta "results": Casos de prueba (test_cases.txt)
Uso en Prolog:
- Cargar el archivo:
consult('src/grammar.pl').
- Analizar una oración:
phrase(o(O), [la, empleada, trabaja]).
- Verificar la validez:
phrase(o(_), [los, empleados, cobran, los, sueldos]).
Expansión del proyecto: Se pueden añadir adjetivos, complementos y estructuras más complejas.
Licencia: Este proyecto se distribuye bajo la licencia Apache-2.0. ¡Contribuciones bienvenidas!
