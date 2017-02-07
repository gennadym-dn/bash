checkout_remove_untracked() {
	# Fix the following error when performing git checkout
	# error: The following untracked working tree files would be overwritten by checkout:                                                     │~
	# 		a
	# 		b
	# Please move or remove them before you can switch branches.                                                                              │~
	# Aborting
	declare branch="$1"
	# Skip the first/last two lines and remove tabs.
	git checkout ${branch} 2>&1 | tail -n +2 | head -n -2 | cut -f 2 | xargs rm
}
