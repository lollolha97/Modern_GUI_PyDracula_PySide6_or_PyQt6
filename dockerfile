# 베이스 이미지로 Ubuntu 20.04 사용
FROM ubuntu:20.04

# 작업 디렉토리 설정
WORKDIR /app

# 환경 변수 설정 (비대화형 모드에서 tzdata 설치 문제 방지)
ENV DEBIAN_FRONTEND=noninteractive

# 시스템 의존성 설치
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip \
    build-essential \
    libgl1-mesa-glx \
    libegl1-mesa \
    libxkbcommon-x11-0 \
    libxcb-xinerama0 \
    libxcb-cursor0 \
    libxcb-render0-dev \
    libxcb-shape0-dev \
    libxcb-xfixes0-dev \
    qtbase5-dev \
    && rm -rf /var/lib/apt/lists/*

# pipenv 설치
RUN pip install pipenv

# 프로젝트 소스 복사
COPY . /app

# 패키지 설치
RUN pipenv install --skip-lock pyqt6 pyside6

# CMD로 프로젝트 실행 (예: main.py 실행)
CMD ["pipenv", "run", "python", "main.py"]