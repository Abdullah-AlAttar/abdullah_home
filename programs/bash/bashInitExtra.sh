export EDITOR=nvim
export VISUAL=nvim
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/go/bin:$PATH

# if grep -q "\-WSL2" /proc/version > /dev/null 2>&1; then
#     if service docker status 2>&1 | grep -q "is not running"; then
#         wsl.exe --distribution "${WSL_DISTRO_NAME}" --user root \
#             --exec /usr/sbin/service docker start > /dev/null 2>&1
#     fi
# fi

zsh
