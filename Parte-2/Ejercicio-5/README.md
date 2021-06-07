# Ejercicio 5 - EMBOSS

Instalar EMBOSS. Escribir un script que llame a algun programa EMBOSS para que realice algun analisis sobre una secuencia de nucleotidos fasta (del Ej.1). Por ejemplo, que calcule los ORF y obtenga las secuencias de proteinas posibles. Luego bajense los motivos de las bases de datos PROSITE (archivo prosite.dat) y por medio del llamado a otro programa EMBOSS realizar el analisis de dominios de las secuencias de aminoacidos obtenidas y escribir los resultados en un archivo de salida.

## Dependencias

- Perl (`sudo apt-get install perl`)
- BioPerl-1.7.8 (`sudo apt-get install bioperl`)
- EMBOSS Suite
- PROSITE

## Instrucciones de uso

```
perl Ex5.pl 0.fasta
```

Se generará un archivo `EMBOSS` con los resultados de la secuencia de acido nucleico mas probable del que provenga a partir de la secuencia del archivo `FASTA` utilizado del ejercicio 1.

```
sh ./Ex5patmatmotifs.sh
```

Se generará un archivo `PATMATMOTIFS` con los resultados de la secuencia utilizada. Este distingue los motivos o dominios que posee la proteina codificada en el archivo utilizado.
