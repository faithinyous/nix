#!/bin/bash

#for i in $(fd sops 'modules/tools/' -t f -E 'sops.nix'); do
#	decrypted_file=${i//.sops/}
#	sops -d "$i" >"$decrypted_file"
#	echo "Decrypted $i"
#done

find . -name "*.sop*" -print | while read -r line; do
	decrypted_file=${i//.sops/}
	sops -d "$i" >"$decrypted_file"
	echo "Decrypted $i"
done
