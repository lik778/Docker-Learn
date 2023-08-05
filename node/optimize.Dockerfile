# 构建阶段
FROM node:18-alpine as build-application

WORKDIR /app

COPY package.json .
# RUN npm install -g cnpm --registry=https://registry.npm.taobao.org && \
#     cnpm install
RUN npm install --registry=https://registry.npm.taobao.org

COPY . .
RUN npm run build

# 第二阶段：生成最终镜像
FROM node:18-alpine

WORKDIR /app

# 从构建阶段复制依赖项到最终镜像中
COPY --from=build-application /app/dist /app/dist
COPY --from=build-application /app/node_modules /app/node_modules
COPY --from=build-application /app/package.json /app/

RUN npm install --arch=arm64 --platform=linux --libc=musl sharp

# 复制后端应用的其他文件和目录到最终镜像中（如果需要）

EXPOSE 3005

CMD [ "npm", "run", "start:prod" ]
