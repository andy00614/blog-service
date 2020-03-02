FROM node:current-slim
WORKDIR /usr/src/app
COPY package.json .
RUN npm install --production
# 定义程序默认端口
EXPOSE 3000
# 运行程序命令(manage是ADD添加的文件夹名称, server.js是自己的程序启动入口文件)
CMD [ "npm", "start" ]
COPY . .
