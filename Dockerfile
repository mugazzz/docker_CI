FROM node:19-alpine as mugaz
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=mugaz /app/build /usr/share/nginx/html