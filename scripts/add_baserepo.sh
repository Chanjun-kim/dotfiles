#!/bin/sh

# 경로 설정
ACTIVATE_DIR="$CONDA_PREFIX/etc/conda/activate.d"
DEACTIVATE_DIR="$CONDA_PREFIX/etc/conda/deactivate.d"

mkdir -p "$ACTIVATE_DIR"
mkdir -p "$DEACTIVATE_DIR"

# PYTHONPATH 설정
echo '#!/bin/sh' > "$ACTIVATE_DIR/env_vars.sh"
echo 'export PYTHONPATH="$HOME/Documents/mirae-n-repo${PYTHONPATH:+:$PYTHONPATH}"' >> "$ACTIVATE_DIR/env_vars.sh"

echo '#!/bin/sh' > "$DEACTIVATE_DIR/env_vars.sh"
echo 'unset PYTHONPATH' >> "$DEACTIVATE_DIR/env_vars.sh"

# PATH 패치
echo '#!/bin/sh' > "$ACTIVATE_DIR/path_patch.sh"
echo 'export PATH="/opt/homebrew/bin:$PATH"' >> "$ACTIVATE_DIR/path_patch.sh"

echo '#!/bin/sh' > "$DEACTIVATE_DIR/path_patch.sh"
echo 'export PATH=$(echo $PATH | sed "s|/opt/homebrew/bin:||")' >> "$DEACTIVATE_DIR/path_patch.sh"
