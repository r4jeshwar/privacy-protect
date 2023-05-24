FROM node:18-alpine

WORKDIR /app

COPY . .

RUN npm i
RUN npm run build

RUN sed "s/localhost/0.0.0.0/g" .svelte-kit/output/server/index.js -i 

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host=0.0.0.0"]
