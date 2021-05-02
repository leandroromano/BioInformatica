# Ejercicio 2 - BLAST

- Escribir un script que realice un BLAST de una o varias secuencias (si son varias se
realiza un Blast por cada secuencia input) y escriba el resultado (blast output) en un archivo.

- Pueden ejecutar BLAST de manera remota o bien localmente (si hacen ambos tienen más puntos!).

## Instalación local de BLAST

- Cumplir con la instalacion necesaria del Ejercicio-1
- Bajar BLAST localmente del FTP del NCBI: https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ o usando `sudo apt-get install ncbi-blast+`
- Bajarse la base de datos
- Instalar Blast remote con `sudo apt install libbio-tools-run-remoteblast-perl`

```
wget ftp://ftp.ncbi.nlm.nih.gov/blast/db/FASTA/swissprot.gz 
```

Descomprimirla en un directorio por ejemplo: `ncbi-blast- 2.3.0+/data/`

- Usar el comando `ncbi-blast-2.3.0+/bin/makeblastdb` sobre el archivo swissprot (el original ya está en formato FASTA) para darle formato de BLAST DB. Dependiendo de la versión de Blast suite que tengan instalado puede que en vez de makeblastdb deban utilizar el comando formatdb.

## Dependencias

- Perl
- BioPerl-1.7.8

## Instrucciones de uso
Ejecutar con `perl`

```
perl Ex2.pl
```