FROM registry.access.redhat.com/ubi9/python-312:latest

# By default, listen on port 8081
EXPOSE 8081/tcp
ENV FLASK_PORT=8081

# Set the working directory in the container
WORKDIR /projects

# Copy the content of the local src directory to the working directory
COPY . .

# Install any dependencies
RUN \
  if [ -f requirements.txt ]; \
    then python3 -m pip install -r requirements.txt; \
  elif [ `ls -1q *.txt | wc -l` == 1 ]; \
    then python3 -m pip install -r *.txt; \
  fi

# Specify the command to run on container start
CMD [ "python", "./app.py" ]
