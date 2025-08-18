#!/bin/zsh

echo "📦 Miniconda 설치 스크립트 시작합니다..."

# 1. Miniconda 설치 스크립트 다운로드
echo "⬇️  Miniconda 설치 파일 다운로드 중..."
curl -LO https://repo.anaconda.com/miniconda/Miniconda3-latest-MacOSX-arm64.sh

# 2. 비인터랙티브 설치 (기본 경로: ~/miniconda3)
echo "⚙️  Miniconda 설치 중..."
bash Miniconda3-latest-MacOSX-arm64.sh -b -p $HOME/miniconda3

# 3. conda 초기화 (zsh 기준)
echo "🔧 conda init 실행 중..."
$HOME/miniconda3/bin/conda init zsh

# 4. .zshrc 다시 불러오기
echo "🔄 ~/.zshrc 적용 중..."
source ~/.zshrc

# 5. conda 기본 설정 최적화
echo "⚙️ conda 설정 최적화..."
conda config --set auto_activate_base false
conda config --set channel_priority strict

# 6. 설치 확인
echo "✅ conda 버전 확인:"
conda --version

# 7. 설치 파일 정리
echo "🧹 설치 스크립트 삭제 중..."
rm Miniconda3-latest-MacOSX-arm64.sh

echo "🎉 Miniconda 설치 및 설정이 완료되었습니다!"

