FROM python:3.9-alpine
# cd app
WORKDIR /app
# Copy from my local to /app inside the container
COPY . ./

# Install Requirements and redis 
RUN pip install -r requirements.txt
RUN apk --update add redis

# Expose appliaction in port 8000
EXPOSE 8000

# Set Environment Variables 
ENV REDIS_HOST=localhost
ENV REDIS_PORT=6379
ENV REDIS_DB=0
ENV HOST=localhost
ENV PORT=8000
ENV ENVIRONMENT=DEV

# run the 
CMD [ "sh","initial.sh" ]