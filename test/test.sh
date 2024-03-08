#!/bin/zsh

# ANSI escape codes for text formatting
RESET='\e[0m'
BOLD='\e[1m'
DIM='\e[2m'
UNDERLINE='\e[4m'
BLINK='\e[5m'
INVERT='\e[7m'
HIDDEN='\e[8m'

# ANSI escape codes for text colors
BLACK='\e[30m'
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BLUE='\e[34m'
MAGENTA='\e[35m'
CYAN='\e[36m'
WHITE='\e[37m'

# ANSI escape codes for background colors
BG_BLACK='\e[40m'
BG_RED='\e[41m'
BG_GREEN='\e[42m'
BG_YELLOW='\e[43m'
BG_BLUE='\e[44m'
BG_MAGENTA='\e[45m'
BG_CYAN='\e[46m'
BG_WHITE='\e[47m'

# Example usage
echo -e "${BOLD}${MAGENTA}ft_nm tests${RESET}"

# Rest of your script...

ft_nm="ft_nm"

# Checking that ft_nm is present in the cwd
if [ ! -e "$ft_nm" ]; then
    echo "${RED}${}[-] The '$ft_nm' binary is not present in '$(pwd)'.${RESET}"
    echo "${RED}${}[-] You must copy your ${WHITE}ft_nm${RED} in ${WHITE}'$(pwd)'${RED}.${RESET}"
    exit 1
else
    echo "${GREEN}[x] Your ft_nm is present in the current working directory.${RESET}"
fi

echo "${YELLOW}\nSetting up test...${RESET}"

# Compiling sources (x64 & x86)
echo "${YELLOW}[x] Compiling sources using x64 & x86 architectures.${RESET}"

# Copying binaries and stripping them
echo "${YELLOW}[x] Copying the binaries and stripping them.${RESET}"

# Compiling shared object
echo "${YELLOW}[x] Compiling shared object using x64 & x86 architectures.${RESET}"

echo "${YELLOW}\nStarting test...${RESET}"

echo "${YELLOW}[x] Testing with no arguments (default: a.out).${RESET}"

echo "${YELLOW}[x] Testing x64 binaries.   (stripped & not stripped)${RESET}"

echo "${YELLOW}[x] Testing x86 binaries.   (stripped & not stripped)${RESET}"

echo "${YELLOW}[x] Testing object files.   (stripped & not stripped)${RESET}"

echo "${YELLOW}[x] Testing shared objects. (stripped & not stripped)${RESET}"

echo "\n[!] You should test that when the file is not found"
echo "[!] the binary behave correctly."
echo "[!] Example: \`nm a.out\` outputs \`nm: 'a.out': No such file\`."


# Bonus : ft_nm with options

# -- MY NOTES -- #

## Test cases ##
# [-] test options (a, g u, r, p) / mixed them

# Better test:
# print what is being tested
# If failed: save the whole test (each steps and output of have been tested)
# diff ft_nm.out nm.out

## SCHEMA ##

#--- x64
#  |---- a.out
#  |---- not stripped binaries
#  |---- stripped binaries
#  |---- no binary
#        ----------------------
#               |---- no args
#               |---- options (bonus)
#               |---- mixed options (bonus)
#
#--- x86
#--- .o (object files)
#--- .so (shared object)
