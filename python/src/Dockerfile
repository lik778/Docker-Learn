FROM python:3.9

WORKDIR /app


COPY app.py /app/


# 安装 Flask
RUN pip install Flask


EXPOSE 5005

CMD ["python","app.py"]