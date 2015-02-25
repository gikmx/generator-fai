spinner(){
    local pid=$1
    local msg=$2
    local len=$(( ${#msg} + 7 ))
    local delay=0.05
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c] %s" "$spinstr" "$msg"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "%0.s\b" `seq 1 $len`
    done
    printf "%0.s "  `seq 1 $len`
    printf "%0.s\b" `seq 1 $len`
}