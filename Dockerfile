# Use the official Python 3.8 slim image as the base image
FROM python:3.9-slim

# Set the working directory within the container
WORKDIR /flask

# Copy the necessary files and directories into the container
COPY templates/ static/ main.py requirements.txt /flask/
COPY templates/ /flask/templates/
COPY static/ /flask/static/
COPY main.py requirements.txt  /flask/

# Upgrade pip and install Python dependencies
RUN pip3 install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Expose port 8000 for the Flask application
EXPOSE 8000

# Define the command to run the Flask application using Gunicorn
CMD ["gunicorn", "main:app", "-b", "0.0.0.0:8000", "-w", "4"]
