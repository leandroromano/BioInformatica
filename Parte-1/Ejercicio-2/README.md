# Ejercicio 2 - BLAST

- Escribir un script que realice un BLAST de una o varias secuencias (si son varias se
realiza un Blast por cada secuencia input) y escriba el resultado (blast output) en un archivo.

- Pueden ejecutar BLAST de manera remota o bien localmente (si hacen ambos tienen más puntos!).

## Instalación local de BLAST

- Cumplir con la instalacion necesaria del Ejercicio-1
- Bajar BLAST(2.8.1-1. La version 2.9.0 tiene issues en el comando blastp) localmente del FTP del NCBI: `http://ftp.br.debian.org/debian/pool/main/n/ncbi-blast+/ncbi-blast+_2.8.1-1+deb10u1_amd64.deb` y luego instalarlo con `sudo dpkg -i ncbi-blast+_2.8.1-1+deb10u1_amd64.deb`. Como requiere de python es necesario luego realizar `sudo apr-get install python` y luego corregir las dependencias de los paquetes `sudo apt --fix-broken install`
- Bajarse la base de datos

```
wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/swissprot.gz 
```

Descomprimirla en un directorio por ejemplo: i`ncbi-blast- 2.3.0+/data/`

- Usar el comando `ncbi-blast-2.3.0+/bin/makeblastdb` sobre el archivo swissprot (el original ya está en formato FASTA) para darle formato de BLAST DB. Dependiendo de la versión de Blast suite que tengan instalado puede que en vez de makeblastdb deban utilizar el comando formatdb o `makeblastdb -in swissprot -dbtype prot -parse_seqids -out swissprot`

## Dependencias

- Perl
- BioPerl-1.7.8

## Instrucciones de uso
Ejecutar con `perl`

```
perl Ex2.pl
```