# 베이스 이미지로 Python 3.9 사용
FROM python:3.9-slim

# 작업 디렉토리 설정
WORKDIR /app

# 시스템 의존성 설치 (필요한 경우)
# RUN apt-get update && apt-get install -y build-essential

# pipenv 및 의존성 설치
RUN pip install pipenv

# Pipfile과 Pipfile.lock을 컨테이너에 복사
COPY Pipfile Pipfile.lock /app/

# 패키지 설치
RUN pipenv install --deploy --ignore-pipfile

# 프로젝트 소스 복사
COPY . /app

# CMD로 프로젝트 실행 (예: main.py 실행)
CMD ["pipenv", "run", "python", "main.py"]