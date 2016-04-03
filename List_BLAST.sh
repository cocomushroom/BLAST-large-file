#!/bin/bash
#SBATCH -o 1B_list_out
#SBATCH -e 1B_list.err
#SBATCH -J 1B_list
#SBATCH --mail-type=all
#SBATCH --mail-user=kohsuanchen803@gmail.com

for f in `ls *NROut`;
do
echo ${f};
grep -nB 4 '<Hit_num>1</Hit_num>' ${f} | grep -o comp.*seq[0-9]* >> fungi_list;
done
