FROM node:24-alpine
LABEL authors="ravinder"

WORKDIR /app

COPY package*.json .

RUN npm ci

COPY src .

EXPOSE 3000

CMD ["node", "src/app.js"]
