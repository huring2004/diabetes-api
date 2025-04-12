# Sử dụng Python 3.9 slim image
FROM python:3.9-slim

# Thiết lập thư mục làm việc trong container
WORKDIR /app

# Copy các file cần thiết vào container
COPY app4.py diabetes_model2.h5 /app/

# Tạo requirements.txt để cài thư viện dễ dàng hơn
RUN echo "flask\ntensorflow-cpu\nnumpy" > requirements.txt

# Cài đặt các dependencies hệ thống cần thiết
RUN apt-get update && apt-get install -y gcc libglib2.0-0 libsm6 libxrender1 libxext6

# Cài đặt các thư viện từ requirements.txt
RUN pip install --no-cache-dir --default-timeout=1000 -r requirements.txt

# Mở port 5000 để chạy API
EXPOSE 5000

# Chạy Flask app khi container khởi động
CMD ["python", "app4.py"]
