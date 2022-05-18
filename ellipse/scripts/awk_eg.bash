#!/bin/bash
BEGIN{
read_flag=0
prepare_flag=0
}

{
	if ($1 == "Loop") {
		prepare_flag=0
		read_flag=0
	}
	if (read_flag==1) {
		printf "%d ",$1 >> "energies_"i".txt"
		printf "%f",$5 >> "energies_"i".txt"
		printf "\n" >> "energies_"i".txt"
	}
	if ($1 == "Per") {
		prepare_flag=1
	}
	if ($1 == "Step" && prepare_flag==1) {
		read_flag=1
		printf "%s ","Step" >> "energies_"i".txt"
		printf "%s","Energy" >> "energies_"i".txt"
		printf "\n" >> "energies_"i".txt"
	}
}

END{

}
