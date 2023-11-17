# Use the official Python image from the Docker Hub
FROM python:3.8

# Copy the local code to the container
COPY . /app

# Set the working directory
WORKDIR /app

# Install the dependencies
RUN pip install -r requirements.txt

# Download the French model for Spacy
RUN python -m spacy download fr_core_news_lg

# Expose the port the app runs on
EXPOSE 80

# Command to run the app
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "80"]
