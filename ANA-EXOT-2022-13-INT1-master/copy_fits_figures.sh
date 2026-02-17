#!/bin/bash

in=/eos/user/p/pberta/4tops/latest_noHistograms_withRankings_withValidationPlots/
out=figures/fits/

#mvas=( BDT GNN )
mvas=( GNN )
#masses=( 400 500 600 700 800 900 1000 )
#masses=( 400 700 1000 )
masses=( 500 )
#selections=( 1L 2L all )
selections=( all )
#mvas=( GNN )
#masses=( 400 )

for mva in "${mvas[@]}"; do
  for mass in "${masses[@]}"; do
    for selection in "${selections[@]}"; do
      mkdir -p ${out}/${mva}/${mass}
      rsync -av --prune-empty-dirs --include "*/"  --include="*.pdf" --exclude="*" ${in}/${mva}/${mass}/${selection} ${out}/${mva}/${mass}
    done
  done
done


#rsync -av --prune-empty-dirs --include "*/"  --include="*.pdf" --exclude="*" ${in}/comparisons ${out}/
