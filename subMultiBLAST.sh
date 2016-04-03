subFile="BLASTX.sh"
jobName="BLASTX"

for file in `find . -name "group_*"`;
	do
	fastaFile=${file}
	jobName=${fastaFile}
	outFile="${fastaFile}.out"
	echo "#!/bin/bash" > $subFile
	echo "#SBATCH -o $outFile" >> $subFile
	echo "#SBATCH -e ${fastaFile}.err" >>$subFile
	echo "#SBATCH -J ${jobName}" >> $subFile
	echo "#SBATCH --mail-type=all" >> $subFile
	echo "#SBATCH --mail-user=kohsuanchen803@gmail.com" >> $subFile
	echo "/opt/apps/sdg/bin/blastx -query $fastaFile -db /dscrhome/kc178/database/fungiNR \
-out "${fastaFile}.FungiNROut" -outfmt 5 -evalue 0.00001 \
-gapopen 11 -gapextend 1" >> $subFile
	
	if [ -e "$outFile" ]; then
		echo "remove $outFile"
		rm "$outFile"
	fi
	
	echo "$subFile and $outFile and $xmlFile"
	sbatch $subFile

done