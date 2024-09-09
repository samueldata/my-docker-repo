# Use a Python base image
FROM python:3.11-slim

# Set environment variables to avoid buffering issues
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set a working directory inside the container
WORKDIR /usr/src/app

# Copy the requirements.txt into the working directory
COPY requirements.txt .

# Install dependencies
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container
COPY . .

# Run the application (this can be overridden in specific use cases)
CMD ["python", "app/main.py"]
