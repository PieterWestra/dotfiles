COLOR="\033[0;31m"
NC="\033[0m" # No Color

distroID=$(cat /etc/*release | grep DISTRIB_ID)
distroRL=$(cat /etc/*release | grep DISTRIB_RELEASE)
distroCD=$(cat /etc/*release | grep DISTRIB_CODENAME)

distro="${distroID##*=} ${distroRL##*=}"

echo -e "${COLOR}Distribution:${NC}\t$distro"
echo -e "${COLOR}Kernel:${NC}\t\t$(uname -r)"
echo -e "${COLOR}Desktop:${NC}\t$DESKTOP_SESSION"
echo -e "${COLOR}Shell:${NC}\t\t$SHELL"
echo -e "${COLOR}User:${NC}\t\t$USER"
echo -e "${COLOR}HOME:${NC}\t\t$HOME"
echo -e "${COLOR}Working dir:${NC}\t$PWD"

echo

# CPU info and remove unwanted characters from the string.
cpu=$(cat /proc/cpuinfo | grep model\ name | head -n1)
echo -e "${COLOR}CPU:${NC}\t\t${cpu##*: }"

# RAM info
ramTotal=$(cat /proc/meminfo | grep MemTotal)
ramTotal=${ramTotal%???}
ramTotal=${ramTotal##*:        }

# Convert kB to MB
echo -e "${COLOR}RAM:${NC}\t\t$(($ramTotal / 1000)) MB"
