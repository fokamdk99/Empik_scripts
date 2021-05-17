local_directory=
remote_directory=

while [ "$1" != "" ]; do
    case $1 in
        -ld | --local_directory )           	shift
                                local_directory="$1"
                                ;;
        -rd | --remote_directory )           	shift
				remote_directory="$1"
                                ;;
	* )			echo "provide values corresponding to the " \
" following flags: -ld (--local_directory), -rd (--remote_directory)" \
", -rh (--remote_host), -ru (--remote_host)"
				exit 1
	esac
	shift
done

echo "$local_directory"
echo "$remote_directory"
if [ -z "$local_directory" ] || [ -z "$remote_directory" ]; then
	echo "provide values corresponding to the " \
" following flags: -ld (--local_directory), -rd (--remote_directory)" \
", -rh (--remote_host), -ru (--remote_host)"
	exit
fi

tar cvf - "$local_directory" | (cd "$remote_directory"; tar xvf -)

