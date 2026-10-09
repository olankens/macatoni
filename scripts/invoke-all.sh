#!/usr/bin/env bash

# shellcheck disable=SC2155
# shellcheck shell=bash

handle_icns() {

	# Launch script
	bash "$(cd "$(dirname "$0")" && pwd)/handle-icns.sh"

}

handle_preview() {

	# Launch script
	bash "$(cd "$(dirname "$0")" && pwd)/handle-preview.sh"

}

handle_readme() {

	# Launch script
	bash "$(cd "$(dirname "$0")" && pwd)/handle-readme.sh"

}

invoke_wrapper() {

	# Handle parameters
	local heading="$1"
	local maximum="$2"
	local version="$3"
	local website="$4"
	local members=("${@:5}")
	local bigness=${#members[@]}

	# Change headline
	printf "\033[22;0t" && clear && printf "\033]0;%s\007" "$heading"

	# Handle colors
	local subdued_ansi=$'\033[2m'
	local website_ansi=$'\033[34;4m'
	local loading_ansi=$'\033[93m'
	local success_ansi=$'\033[92m'
	local failure_ansi=$'\033[91m'
	local refresh_ansi=$'\033[0m'

	# Handle widths
	local heading_width=$((maximum - 23))
	local version_width=16
	local logfile_width=$(((maximum - 19) / 2))
	local website_width=$(((maximum - 19) - logfile_width))

	# Handle borders
	printf -v spacing '%*s' "$maximum" ''
	local heading_line=${spacing:0:heading_width+2}
	local version_line=${spacing:0:version_width+2}
	local counter_line=${spacing:0:7}
	local runtime_line=${spacing:0:10}
	local caption_line=${spacing:0:5}
	local logfile_line=${spacing:0:logfile_width+2}
	local website_line=${spacing:0:website_width+2}
	for outline in heading_line version_line counter_line runtime_line caption_line logfile_line website_line; do printf -v "$outline" '%s' "${!outline// /─}"; done
	trap 'printf "\033[?25h"' EXIT && printf '\033[?25l'

	# Output heading
	printf '%s╭%s┬%s╮%s\n' "$subdued_ansi" "$heading_line" "$version_line" "$refresh_ansi"
	printf '%s│%*s│%*s│%s\n' "$subdued_ansi" $((heading_width + 2)) '' $((version_width + 2)) '' "$refresh_ansi"
	printf '%s│%s %-*s %s│%s %*s %s│%s\n' "$subdued_ansi" "$refresh_ansi" "$heading_width" "$heading" "$subdued_ansi" "$refresh_ansi" "$version_width" "v$version" "$subdued_ansi" "$refresh_ansi"
	printf '%s│%*s│%*s│%s\n' "$subdued_ansi" $((heading_width + 2)) '' $((version_width + 2)) '' "$refresh_ansi"
	printf '%s╰%s┴%s╯%s\n' "$subdued_ansi" "$heading_line" "$version_line" "$refresh_ansi"

	# Output information
	local logfile="$(mktemp -d /tmp/XXXXXXXXXXX)/${heading}.log"
	local logpath="FILE://${logfile^^}"
	local weblink="${website^^}"
	printf '%s╭%s┬%s┬%s┬%s╮%s\n' "$subdued_ansi" "$caption_line" "$logfile_line" "$caption_line" "$website_line" "$refresh_ansi"
	printf '%s│%s %s %s│%s %s%-*s%s %s│%s %s %s│%s %s%-*s%s %s│%s\n' "$subdued_ansi" "$refresh_ansi" "LOG" "$subdued_ansi" "$refresh_ansi" "$website_ansi" "$logfile_width" "$logpath" "$refresh_ansi" "$subdued_ansi" "$refresh_ansi" "GIT" "$subdued_ansi" "$refresh_ansi" "$website_ansi" "$website_width" "$weblink" "$refresh_ansi" "$subdued_ansi" "$refresh_ansi"
	printf '%s╰%s┴%s┴%s┴%s╯%s\n' "$subdued_ansi" "$caption_line" "$logfile_line" "$caption_line" "$website_line" "$refresh_ansi"

	# Output progress
	local topline="${subdued_ansi}╭${heading_line}┬${counter_line}┬${runtime_line}╮${refresh_ansi}"
	local divider="${subdued_ansi}├${heading_line}┼${counter_line}┼${runtime_line}┤${refresh_ansi}"
	local botline="${subdued_ansi}╰${heading_line}┴${counter_line}┴${runtime_line}╯${refresh_ansi}"
	printf '%s\n' "$topline"
	printf '%s│%s %-*s %s│%s %-5s %s│%s %-8s %s│%s\n' "$subdued_ansi" "$refresh_ansi" "$heading_width" "FUNCTION" "$subdued_ansi" "$refresh_ansi" "ITEMS" "$subdued_ansi" "$refresh_ansi" "DURATION" "$subdued_ansi" "$refresh_ansi"
	printf '%s\n' "$divider"
	local counter=0 && for running in "${members[@]}"; do
		((++counter)) && printf '\n%s\n\033[2A\r' "$botline"
		local started=$SECONDS
		printf '\n%s ' "${running^^}" >>"$logfile"
		printf '%*s\n\n' $((80 - ${#running} - 1)) '' | tr ' ' '-' >>"$logfile" && eval "$running" >>"$logfile" 2>&1 &
		local taskpid=$! && local wrapped=0
		while ((!wrapped)); do
			local context=$loading_ansi
			if ! kill -0 "$taskpid" 2>/dev/null; then wrapped=1 && if wait "$taskpid"; then context=$success_ansi; else context=$failure_ansi; fi; fi
			local elapsed=$((SECONDS - started))
			printf '\r%s│%s %s%-*s%s %s│%s %s%02d/%02d%s %s│%s %s%02d:%02d:%02d%s %s│%s' "$subdued_ansi" "$refresh_ansi" "$context" "$heading_width" "${running^^}" "$refresh_ansi" "$subdued_ansi" "$refresh_ansi" "$context" "$counter" "$bigness" "$refresh_ansi" "$subdued_ansi" "$refresh_ansi" "$context" $((elapsed / 3600)) $((elapsed % 3600 / 60)) $((elapsed % 60)) "$refresh_ansi" "$subdued_ansi" "$refresh_ansi"
			((wrapped)) || sleep 0.1
		done
		if ((counter < bigness)); then printf '\033[1B\r%s\n' "$divider"; else printf '\033[2B\r'; fi
	done
	printf '\033[?25h'

	# Revert headline
	trap 'printf "\033[23;0t"' EXIT

	# Output newline
	printf "\n"

}

main() {

	# Enable strictness
	set -euo pipefail

	# Handle globals
	local heading="MACATONI"
	local version="1.1.0" # x-release-please-version
	local website="https://github.com/olankens/macatoni"

	# Handle functions
	local members=(
		"handle_icns"
		"handle_preview"
		"handle_readme"
	)

	# Invoke wrapper
	invoke_wrapper "$heading" "91" "$version" "$website" "${members[@]}"

}

if [[ -z "${BASH_SOURCE[0]:-}" || "${BASH_SOURCE[0]}" == "$0" ]]; then main "$@"; fi
