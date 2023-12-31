# Use an official Python runtime as a base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Make the container’s port 80 available to the outside world
EXPOSE 8000

# Define environment variable
ENV NAME fraud

# Run app.py when the container launches
CMD ["python", "./api/app.py"]

