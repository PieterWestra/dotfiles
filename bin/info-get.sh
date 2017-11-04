COLOR="\e[1;31m"
NC="\e[0m"

new_line(){
	echo
}

print_distro(){
	distroID=$(cat /etc/*release | grep DISTRIB_ID)
	distroRL=$(cat /etc/*release | grep DISTRIB_RELEASE)
	distroCD=$(cat /etc/*release | grep DISTRIB_CODENAME)
	
	distro="${distroID##*=} ${distroRL##*=}"

	echo -e "${COLOR}Distribution:${NC}\t$distro"
}

print_kernel(){
	echo -e "${COLOR}Kernel:${NC}\t\t$(uname -r)"
}

print_desktop(){
	echo -e "${COLOR}Desktop:${NC}\t$DESKTOP_SESSION"
}

print_shell(){
	echo -e "${COLOR}Shell:${NC}\t\t$SHELL"
}

print_user(){
	echo -e "${COLOR}User:${NC}\t\t$USER"
}

print_dirs(){
	echo -e "${COLOR}HOME:${NC}\t\t$HOME"
	echo -e "${COLOR}Working dir:${NC}\t$PWD"
}

print_cpu(){
	cpu=$(cat /proc/cpuinfo | grep model\ name | head -n1)
	echo -e "${COLOR}CPU:${NC}\t\t${cpu##*: }"
}

print_ram(){
	ramTotal=$(cat /proc/meminfo | grep MemTotal)
	ramTotal=${ramTotal%???}
	ramTotal=${ramTotal##*:        } 
	
	# Convert kB to MB
	echo -e "${COLOR}RAM:${NC}\t\t$(($ramTotal / 1000)) MB"
}

print_distro
print_kernel
print_desktop
print_shell
print_user
print_dirs

new_line
print_cpu
print_ram
