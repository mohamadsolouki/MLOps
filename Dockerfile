# Use an official Python runtime as a base image with a specific minor version for better consistency
FROM python:3.8.10-slim-buster

# Set the working directory in the container
WORKDIR /app

# Install any needed packages specified in requirements.txt
# Copy only the requirements.txt initially to leverage Docker cache
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application's code into the container at /app
COPY . /app

# Make the container’s port 8000 available to the outside world
EXPOSE 8000

# Use a non-root user to run your application for better security
RUN useradd -m myuser
USER myuser

# Define environment variable
ENV NAME fraud

# Run app.py when the container launches
CMD ["python", "api/app.py"]
