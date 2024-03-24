# Use the official Python image as the base image
FROM python:3.9-slim

# Copy the index.html file into the container
COPY index.html /app/

# Set the working directory
WORKDIR /app

# Expose port 8000 to allow external access to the Python HTTP server
EXPOSE 8000

# Run a Python HTTP server to serve the index.html file
CMD ["python", "-m", "http.server", "8000"]
