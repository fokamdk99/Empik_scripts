
local_directory=
remote_directory=
remote_user=
remote_host=

while [ "$1" != "" ]; do
    case $1 in
        -ld | --local_directory )           	shift
                                local_directory="$1"
                                ;;
        -rd | --remote_directory )           	shift
				remote_directory="$1"
                                ;;
        -rh | --remote_host )           	shift
                                remote_host="$1"
                                ;;
        -ru | --remote_user )                   shift
                                remote_user="$1"
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
echo "$remote_user"
echo "$remote_host"
if [ -z "$local_directory" ] || [ -z "$remote_directory" ] || [ -z "$remote_host" ] || [ -z "$remote_user" ]; then
	echo "podaj wszystkie dane"
	exit
fi


tar czf - "$local_directory" | ssh "$remote_user"@"$remote_host" "cd $remote_directory && tar xvzf -"
