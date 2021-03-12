## we have two files that have two common column of them, select the second file content based on the first file
# the first way
awk '{print $1,$2}' 4d_n.bed | tr -s '\t' ' ' > 4d_n.bed1
awk ‘NR>110{print $0}’ z.vcf | tr -s ‘\t’ ‘ ’ > z1.vcf 
vim get.sh
cat 4d_n.bed1 | while read line
do
grep -w “^$line” z1.vcf >> result.txt
done

# the second way
awk 'NR==FNR{a[$1,$2]=$0;next}{print a[$1,$2]}' z1.vcf 4d_n.bed1 > a
grep -v '^$' a > out.vcf
