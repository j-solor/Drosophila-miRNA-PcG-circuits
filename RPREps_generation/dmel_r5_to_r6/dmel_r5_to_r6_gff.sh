#!/bin/bash


#	This script uses flybase downloadable converter (dmel_r5_to_r6_converter.pl) and 
#	wraps all the processing to use it from and to GFFs
#
#	To customize the columns to be kept (a side from cordinates) play with #1 fields $10 and $11,
#	keeping the first one as the score and the second one as the info column in the outcome
#
#	input arguments
#	- GFF to be lifted to R6
#	- name of the converted GFF
#	- nº of rows to skip of the first GFF (titles, coments etc.)
#
#	output
#	- Ordered GFF named as specified in $2


####################
##ARGS AND ASSERTS##
####################

OG_GFF=$1
OUT_GFF=$2
skip=$3


#############
##MAIN BODY##
#############


#1 Convert to dmel_r5_to_r6_converter.pl input format + \t ID
awk -v var=$skip 'NR>var {print $1 ":" $4 ".." $5 "\t" $10 "\t" $11}' $OG_GFF > $"temp_cords.txt"


#2 use dmel_r5_to_r6_converter.pl
cut -f 1 temp_cords.txt | ./dmel_r5_to_r6_converter.pl  --output temp_cords_r6.txt

head -n 4 temp_cords_r6.txt 
echo "-----------"


#3 mapping of converted coordinates to its IDs stored in temp_cords.txt
join -j1 -o 2.1,1.2,2.2,2.3 -e NAN -a1 -a2 <(tail -n +6 temp_cords_r6.txt|sort) <(sort temp_cords.txt) > temp_cords_r6_joined.txt      

#4 formating to a GFF
awk '
BEGIN { print "chr	noth1	noth2	start	stop	score	noth3	info	PREname"}
{
	split($2, a, ":"); split(a[2], b, "."); 
	print a[1] "\tUnnamed\tUnnamed\t" b[1] "\t" b[3] "\t" $3 "\t.\t" $1 "\t" $4


}' temp_cords_r6_joined.txt > $OUT_GFF

#5 cleaning
rm "temp_cords.txt" "temp_cords_r6.txt" "temp_cords_r6_joined.txt"

echo "Finished"