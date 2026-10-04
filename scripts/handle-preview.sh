#!/usr/bin/env bash

# shellcheck disable=SC2155
# shellcheck shell=bash

create_preview() {

	# Handle paths
	local scripts="$(cd "$(dirname "$0")" && pwd)"
	local icondir="$(cd "$scripts/.." && pwd)/source"
	local preview="$(cd "$scripts/.." && pwd)/.assets/preview-02.avif"
	local tempdir="$(mktemp -d)"

	# Gather icons
	mapfile -t members < <(find "$icondir" -maxdepth 2 -name "*.png" | shuf | head -n 16)
	for i in "${!members[@]}"; do
		local pngfile="${members[$i]}"
		[[ -e "$pngfile" ]] || continue
		local bgcolor=$([ $(((i / 4 + i % 4) % 2)) -eq 0 ] && echo "#292524" || echo "#44403c")
		magick "$pngfile" \
			-resize 256x256! \
			-bordercolor "$bgcolor" \
			-border 80x45 \
			"$tempdir/$(printf "%03d" $((i + 1))).png"
	done

	# Create preview
	{ magick montage "$tempdir"/*.png -tile 4x4 -geometry +0+0 png:- | magick png:- -resize 1008x832! png:- | avifenc --stdin --input-format png -d 8 -q 90 -y 444 "$preview"; } || true

	# Remove remnants
	rm -rf "$tempdir"

}

update_dependencies() {

	# Update imagemagick
	printf "y\n" | brew install imagemagick
	printf "y\n" | brew upgrade imagemagick

	# Update avifenc
	printf "y\n" | brew install libavif
	printf "y\n" | brew upgrade libavif

}

main() {

	# Enable strictness
	set -euo pipefail

	# Update dependencies
	update_dependencies

	# Create preview
	create_preview

}

if [[ -z "${BASH_SOURCE[0]:-}" || "${BASH_SOURCE[0]}" == "$0" ]]; then main "$@"; fi
