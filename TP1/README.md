# Ejercicio 1 - Procesamiento de Secuencias

- Escribir un script que lea una o más secuencias (de nucleótidos) de un archivo que contenga la información en formato GenBank de un mRNA de su gen (o genes) de interés, las traduzca a sus secuencias de amino ácidos posibles (tener en cuenta los Reading Frames) y escriba los resultados en un archivo en formato FASTA. 

- Ustedes deben generarse su archivo GenBank de secuencias input, por ejemplo realizando una consulta de los mRNA del gen INS (que está asociado a la Diabetes) en la base de datos de NCBI-Gene y obtener uno o más resultados en formato GenBank en un archivo de texto. 

- Si no desean seguir trabajando con las seis secuencias de aa posibles, pueden utilizar alguna función o programa que les permita saber cual el es marco de lectura correcto y seguir con esa secuencia.

## Dependencias

- Perl
- BioPerl-1.7.8

## Instrucciones de uso

```
perl tp1.pl ./sequence.gb out
```

Se generarán 6 archivos `FASTA`, nombrados `out-<frame>.fasta` y `out-<frame>-reverse.fasta`.

Cada archivo es una de las 6 posibles secuencias de aminoácidos posibles. Queda para el futuro saber cuál es la correcta.