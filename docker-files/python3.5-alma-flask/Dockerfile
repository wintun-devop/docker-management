FROM almalinux:9

# Install Python
RUN dnf install -y python3 python3-pip && \
    dnf clean all

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy Flask app code
COPY . .

# Expose Flask port
EXPOSE 5000

CMD ["python3", "app.py"]
