# Ejercicio 4 - Procesamiento de Secuencias

Escribir un script para analizar (parsear) un reporte de salida de blast que
identifique los hits que en su descripción aparezca un Pattern determinado que le damos como parámetro
de entrada. El pattern puede ser una palabra. Nota para punto extra: Si quieren pueden parsear cuál es el
ACCESSION del hit seleccionado (donde hay una coincidencia del Pattern) y con el módulo
Bio::DB::GenBank obtener la secuencia completa del hit en formato FASTA y escribirla un archivo, es decir,
levantar la secuencia original de los hits seleccionados.

## Dependencias

- Perl (`sudo apt-get install perl`)
- BioPerl-1.7.8 (`sudo apt-get install bioperl`)

## Instrucciones de uso

```
perl Ex4.pl "Pattern"
```

Se generará un archivo `FASTA` por cada match del pattern
