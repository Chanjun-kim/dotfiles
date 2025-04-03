#!/bin/bash

# API Key 등록
add_key() {
    read -p "🔑 저장할 키 이름: " NAME
    read -p "📄 설명 (옵션): " NOTES
    read -sp "🔐 API Key 값: " VALUE
    echo

    bw create item "{
      \"type\": 1,
      \"name\": \"$NAME\",
      \"login\": {
        \"username\": \"API\",
        \"password\": \"$VALUE\"
      },
      \"notes\": \"$NOTES\"
    }" --session $BW_SESSION

    echo "✅ 저장 완료"
}

# 키 조회
get_key() {
    read -p "조회할 키 이름: " NAME
    VALUE=$(bw get password "$NAME" --session $BW_SESSION)
    echo "🔍 $NAME = $VALUE"
}

# 전체 목록 보기
list_keys() {
    echo "📄 저장된 키 목록:"
    bw list items --session $BW_SESSION | jq '.[].name'
}

# 메뉴
echo "==============================="
echo "🗝️  Bitwarden Key Manager"
echo "1) Key 추가"
echo "2) Key 조회"
echo "3) Key 목록 확인"
echo "==============================="
read -p "선택: " MENU

case $MENU in
    1) add_key ;;
    2) get_key ;;
    3) list_keys ;;
    *) echo "❗️잘못된 선택" ;;
esac