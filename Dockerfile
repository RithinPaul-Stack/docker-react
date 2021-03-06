FROM node:alpine as builder
WORKDIR '/ProdApp'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
COPY --from=builder /ProdApp/build  /usr/share/nginx/html