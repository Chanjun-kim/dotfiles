import os
import json
 
import argparse
 
parser = argparse.ArgumentParser()
parser.add_argument('--env', required=True)
parser.add_argument('--user', required=True)
 
args = parser.parse_args()
# ENV_NAME = os.environ["CONDA_DEFAULT_ENV"]
ENV_NAME = args.env
USER = args.user
print(ENV_NAME)
 
# json_file = f"/home/sagemaker-user/.local/share/jupyter/kernels/{ENV_NAME}/kernel.json"
# json_file = f"kernel.json"
json_file = f"/Users/{USER}/Library/Jupyter/kernels/{ENV_NAME}/kernel.json"
bak_file = json_file + ".bak"
 
with open(json_file, "r") as f:
    kernel_info = json.load(f)

with open(bak_file, "w") as f:
    json.dump(kernel_info, f, indent = 4)


change_word = [
  "bash",
  "-c",
  f"source \"/Users/{USER}/opt/anaconda3/bin/activate\" \"/Users/{USER}/opt/anaconda3/envs/{ENV_NAME}\" && exec /Users/{USER}/opt/anaconda3/envs/{ENV_NAME}/bin/python -m ipykernel_launcher -f {{connection_file}}"
]
 
kernel_info["argv"] = change_word
 
with open(json_file, "w") as f:
    json.dump(kernel_info, f, indent = 4)
