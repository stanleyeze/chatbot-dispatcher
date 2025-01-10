# Use a lightweight Python image
FROM python:3.9-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# Copy and install dependencies
COPY requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY src /app/src

# Expose the port if necessary (not typical for Lambda functions)
# EXPOSE 8000

# Command to run the Lambda handler
CMD ["python", "src/lambda_function.py"]
