# Use the official Python image from Docker Hub as a base image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements.txt file to the container's working directory
COPY requirements.txt .

# Install the required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Install Jupyter and other tools (if you need them)
RUN pip install jupyter

# Copy the project files into the container's working directory
COPY . .

# Expose port 8888 for Jupyter Notebook
EXPOSE 8888

# Start Jupyter Notebook when the container starts
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
