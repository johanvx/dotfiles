set -gx RUSTUP_DIST_SERVER "https://rsproxy.cn"
set -gx RUSTUP_UPDATE_ROOT "https://rsproxy.cn/rustup"

if type -q $HOME/.cargo/env.fish
    source "$HOME/.cargo/env.fish"
end
