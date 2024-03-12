FROM python:3.7-alpine

# Set environment variable
ENV PYTHONUNBUFFERED 1

# Create a new user
RUN adduser -D user

# Set the working directory
WORKDIR /app

# Copy requirements file
COPY ./requirements.txt /app/requirements.txt

# Install dependencies using non-root user
RUN pip install --no-cache-dir --user -r /app/requirements.txt

# Add .local/bin to PATH
ENV PATH="/home/user/.local/bin:${PATH}"

# Change ownership of application directory to non-root user
RUN chown -R user:user /app

# Switch to non-root user
USER user

# Copy application code
COPY ./app /app

# Command to run the application
CMD ["python", "app.py"]

# Informasi pembaruan pip
RUN pip install --upgrade pip \
    && echo "[notice] A new release of pip is available: $(pip --version | cut -d ' ' -f 2) -> $(pip search pip | grep -oP '^pip \(\K[^\)]+') \
    && echo '[notice] To update, run: pip install --upgrade pip'

