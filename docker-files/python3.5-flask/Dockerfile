# Use Python 3.13.5 on Debian Bullseye
FROM python:3.13.5-bullseye

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY . .

# Expose Flask port
EXPOSE 8000

# Run the app
CMD ["python", "app.py"]
