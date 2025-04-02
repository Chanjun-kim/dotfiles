#!/bin/zsh
source ~/.zshrc   # zsh 사용 시

if [ -z "$1" ]; then
    echo "Error env_name is required"
    exit 1
fi

# eval $1

version_default=3.12

if [ -z "$2" ]; then
    version=$version_default
else
    # eval $2
    version=$2
fi

echo "conda create -n $1 python=$version -y"
conda create -n $1 python=$version -y

conda init
# conda activate
# . activate base
conda activate "$1"

echo "$(which python)"
# python_path=$(which python)
# # python_path="/home/sagemaker-user/.conda/envs/test_env/bin/python"# 'envs' 이후의 값을 추출 (세 번째 필드 추출)
# env_name=$(echo $python_path | sed -n 's|.*/envs/\([^/]*\)/.*|\1|p')

# echo $env_name
env_name=$1
user=$(whoami)

echo "env name = $env_name"
echo "user = $user"

pip install -U pip
pip install -r ~/dotfiles/requirements.txt
pip install -U jupyter
pip install ipykernel
python -m ipykernel install --user --name $env_name --display-name "Python($env_name)"
python ~/dotfiles/scripts/edit_kernel.py --env $env_name --user $user
echo "Creat Python Kernel $env_name"
