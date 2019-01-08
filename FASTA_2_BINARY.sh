#!/bin/bash/
#small code to make binary from the DNA fasta sequence
echo "FASTA_2_BINARY.sh - written by Abhijeet Singh (abhijeetsingh.aau@gmail.com)"
echo "Translating DNA bases to 0 and 1"
echo "please provide the name of your fasta file"
read filename
fasta_file=filename
cut -d ' ' -f1 ${!fasta_file} > ${!fasta_file}_trimhead
awk 'BEGIN{RS=">"}NR>1{sub("\n","\t"); gsub("\n",""); print RS$0}' ${!fasta_file}_trimhead > ${!fasta_file}_tab
cat ${!fasta_file}_tab | awk '{print $1}' > ${!fasta_file}_tab_col1
cat ${!fasta_file}_tab | awk '{print $2}' > ${!fasta_file}_tab_col2
echo    the codes used are: 
echo    "   A=00"
echo    "   T=11"
echo    "   C=01"
echo    "   G=10"
sed 's/A/00/g;s/T/11/g;s/C/01/g;s/G/10/g' ${!fasta_file}_tab_col2 > ${!fasta_file}_tab_col2_2
paste ${!fasta_file}_tab_col1 ${!fasta_file}_tab_col2_2 | column -s $'\t' -t > ${!fasta_file}_binary.txt
rm -f ${!fasta_file}_trimhead ${!fasta_file}_tab ${!fasta_file}_tab_col1 ${!fasta_file}_tab_col2 ${!fasta_file}_tab_col2_2
echo "                            ========================="
echo "your result file is ---->>> ${!fasta_file}_binary.txt"
echo "                            ========================="
