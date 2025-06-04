#!/bin/zsh
source ~/.zshrc   # zsh 사용 시
if [ -z "$1" ]; then    
    echo "Error env_name is required"    
    exit 1
fi

if conda env list | grep -1 "^$1"; then
    echo "$1 conda env start to remove"
else
    echo "$1 is not exist"    
    exit 1
fi

conda init
# . activate base
conda activate base
# conda deactivate 
conda env remove -n "$1"
jupyter kernelspec uninstall "$1" -y