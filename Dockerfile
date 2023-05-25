FROM node:18-alpine as build

WORKDIR /app

COPY . .

RUN npm i
RUN npm run build


FROM nginx:stable-alpine

COPY --from=build /app/build/ /usr/share/nginx/html
