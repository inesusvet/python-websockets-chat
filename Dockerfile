FROM python:2-alpine3.7

RUN apk add --no-cache gcc musl-dev

WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

CMD ["gunicorn", "-k", "flask_sockets.worker", "chat:app"]
