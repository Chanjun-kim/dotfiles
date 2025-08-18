#!/bin/zsh

# Bitwarden 세션 확인
if [[ -z "$BW_SESSION" ]]; then
  echo "❗️ BW_SESSION 환경 변수가 설정되지 않았습니다."
  echo "🔐 먼저 로그인 후 'export BW_SESSION=\$(bw unlock --raw)' 해주세요."
  exit 1
fi

# API Key 등록
add_key() {
    echo -n "🔑 저장할 키 이름: "
    read NAME
    echo -n "📄 설명 (옵션): "
    read NOTES
    echo -n "🔐 API Key 값: "
    read -s VALUE
    echo

    bw create item <<EOF --session "$BW_SESSION"
{
  "type": 1,
  "name": "$NAME",
  "login": {
    "username": "API",
    "password": "$VALUE"
  },
  "notes": "$NOTES"
}
EOF

    echo "✅ 저장 완료"
}

# 키 조회
get_key() {
    echo -n "조회할 키 이름: "
    read NAME
    VALUE=$(bw get password "$NAME" --session "$BW_SESSION")
    echo "🔍 $NAME = $VALUE"
}

# 전체 목록 보기
list_keys() {
    echo "📄 저장된 키 목록:"
    bw list items --session "$BW_SESSION" | jq -r '.[].name'
}

# 메뉴
echo "==============================="
echo "🗝️  Bitwarden Key Manager"
echo "1) Key 추가"
echo "2) Key 조회"
echo "3) Key 목록 확인"
echo "==============================="
echo -n "선택: "
read MENU

case $MENU in
    1) add_key ;;
    2) get_key ;;
    3) list_keys ;;
    *) echo "❗️잘못된 선택" ;;
esac