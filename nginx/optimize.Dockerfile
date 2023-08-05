FROM node:18-alpine as build-application

WORKDIR /app

COPY package.json ./

RUN npm install --registry=https://registry.npm.taobao.org

COPY , ,

RUN npm run build

FROM nginx:alpine

COPY --from=build-application /app/build /usr/share/nginx/html

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 3000

# 启动容器时启动nginx
CMD nginx -g "daemon pff" 

