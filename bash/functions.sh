projcd() {
    local dir
    dir=$(
        find ~/projects -mindepth 1 -maxdepth 1 -type d \
        | sort \
        | fzf \
            --preview 'eza --tree --level=2 --icons --color=always --git {}' \
            --preview-window=right:60%
    ) || return
    cd "$dir"
}
testsite() {
    python3 -m http.server 8000
}
timer() {
  sleep "$1"
  notify-send "Timer done" "${2:-Finished}"
}
