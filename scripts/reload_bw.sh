#!/bin/bash

echo "🔐 Bitwarden CLI 세션 갱신 중..."

# 1. 로그인 상태 확인
status=$(bw status | jq -r '.status')
if [[ "$status" != "unlocked" ]]; then
    echo "⚠️ Bitwarden vault가 잠겨있습니다. 마스터 비밀번호를 입력하세요."
    SESSION_KEY=$(bw unlock --raw)
else
    echo "✅ 이미 잠금 해제 상태입니다."
    SESSION_KEY=$(bw unlock --raw)
fi

# 2. .zshrc에 등록
echo "export BW_SESSION=$SESSION_KEY" >> ~/.zshrc
echo "✅ BW_SESSION이 ~/.zshrc에 등록되었습니다."

# 3. 적용
source ~/.zshrc
echo "🎉 세션 키가 적용되었습니다!"

