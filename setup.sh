#!/bin/zsh

echo "🔧 Alias 영구 등록 시작..."

ALIAS_PATH="$HOME/dotfiles/scripts/alias.sh"
ZSHRC="$HOME/.zshrc"

# 이미 .zshrc에 등록되어 있는지 확인
if ! grep -q "source $ALIAS_PATH" "$ZSHRC"; then
    echo "source $ALIAS_PATH" >> "$ZSHRC"
    echo "✅ .zshrc에 alias.sh 자동 등록 완료"
else
    echo "ℹ️ 이미 .zshrc에 alias.sh가 등록되어 있습니다"
fi

# 현재 세션에도 바로 적용
source "$ALIAS_PATH"

echo "✅ Alias 영구 등록 완료"