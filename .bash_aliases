alias drajv='sudo mkdir -p /mnt/g && sudo mount -t drvfs G: /mnt/g && cd /mnt/g/"My Drive"'  

alias elektro='sudo mkdir -p /mnt/g && sudo mount -t drvfs G: /mnt/g && cd /mnt/g/"My Drive"/3Wissenschaft/1Elektronik/1Kompjutor'

alias web='cd /mnt/c/Users/Roni/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/ && pdf Brave'

alias ubu='(cd /mnt/c && cmd.exe /c start wsl.exe --cd ~)'
# cmd.exe /c start wsl.exe --cd "$(pwd)"  to start in the current directory

alias fotrh='cd ~/archive/forth/forth-old/fotrh && make term'

alias s='cd ~/code/forth/sixforths/src && k'

alias f='cd ~/code/forth/fig-FORTH-RISC-V/ && k'

alias regs='wlink regs && wlink reset'

alias k='ls -1a'

# Launch Double Commander, guarding its config against being wiped.
# If doublecmd.xml is empty/broken (e.g. WSL killed mid-save), DC silently
# resets to defaults. So: snapshot the config when it is valid, and restore
# the latest snapshot when it is not. Keeps the last 10 snapshots.
unalias dc 2>/dev/null
dc() {
    local cfg=~/.config/doublecmd bak=~/.local/state/doublecmd-backups
    mkdir -p "$bak"
    if python3 -I -c 'import sys,xml.etree.ElementTree as E; E.parse(sys.argv[1])' "$cfg/doublecmd.xml" 2>/dev/null; then
        local snap="$bak/$(date +%Y%m%d-%H%M%S)"
        mkdir -p "$snap" && cp -p "$cfg"/{doublecmd.xml,tabs.xml,colors.json} "$snap"/ 2>/dev/null
        ls -1d "$bak"/*/ | head -n -10 | xargs -r rm -rf
    else
        local last=$(ls -1d "$bak"/*/ 2>/dev/null | tail -1)
        if [ -n "$last" ]; then
            echo "dc: doublecmd.xml is broken, restoring from $last" >&2
            cp -p "$last"/* "$cfg"/
        else
            echo "dc: doublecmd.xml is broken and no backup exists; try: cd ~/code/tilde && git restore doublecmd" >&2
            return 1
        fi
    fi
    setsid doublecmd >/dev/null 2>&1 &
}



#alias mobi='idf.py -p /dev/ttyACM0 monitor'
#alias mobiFull='cd ~/mobi && rm -rf build && idf.py set-target esp32 && idf.py build && idf.py -p /dev/ttyACM0 flash monitor'



