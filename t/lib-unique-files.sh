# Helper to create files with unique contents


# Create multiple files with unique contents. Takes the number of
# directories, the number of files in each directory, and the base
# directory.
#
# test_create_unique_files 2 3 my_dir -- Creates 2 directories with 3 files
#					 each in my_dir, all with unique
#					 contents.

test_create_unique_files() {
	test "$#" -ne 3 && BUG "3 param"

	local dirs=$1
	local files=$2
	local basedir=$3
	local counter=0
	test_tick
	local basedata=$test_tick


	rm -rf $basedir

	for i in $(test_seq $dirs)
	do
		local dir=$basedir/dir$i

		mkdir -p "$dir"
		for j in $(test_seq $files)
		do
			counter=$((counter + 1))
			echo "$basedata.$counter"  >"$dir/file$j.txt"
		done
	done
}
