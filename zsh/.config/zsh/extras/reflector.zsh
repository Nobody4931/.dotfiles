# Stop execution if reflector is not installed
command -v reflector &> /dev/null || return 0

function update_mirrors() {
	sudo cp -f "/etc/pacman.d/mirrorlist" "/etc/pacman.d/mirrorlist.bak" \
		&& sudo reflector --fastest 30 --latest 30 --number 15 --verbose --save "/etc/pacman.d/mirrorlist"
}
