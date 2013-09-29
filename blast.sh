cd /mnt
rm -fr titus
mkdir titus
cd titus
curl -O http://ftp.ncbi.nlm.nih.gov/genomes/Bacteria/Escherichia_coli_K_12_substr__MG1655_uid57779/NC_000913.faa

curl -O http://ftp.ncbi.nlm.nih.gov/genomes/Bacteria/Salmonella_enterica_Serovar_Typhimurium_var__5__CFSAN001921_uid212972/NC_021814.faa

formatdb -i NC_000913.faa -o T -p T
blastall -i NC_021814.faa -d NC_000913.faa -p blastp -e 1e-12 -o salm.x.ecoli

python /usr/local/share/ngs-scripts/blast/blast-to-csv-with-names.py NC_021814.faa NC_000913.faa salm.x.ecoli > salm.x.ecoli.csv

formatdb -i NC_021814.faa -o T -p T
blastall -i NC_000913.faa -d NC_021814.faa -p blastp -e 1e-12 -o ecoli.x.salm

python /usr/local/share/ngs-scripts/blast/blast-to-ortho-csv.py NC_021814.faa NC_000913.faa salm.x.ecoli ecoli.x.salm > ortho.csv

