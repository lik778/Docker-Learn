### 1、创建一个简单的 Web 服务应用程序（app.py）：
  见 app.py
### 2、创建Dockerfile 文件
  见 Dockerfile
### 3、构建镜像
```sh
  docker build -t my_python_test .
```
### 4、运行镜像
```sh
  docker run -d --network host my_python_test
```