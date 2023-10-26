# specify the node base image with your desired version node:<version>
FROM node:20-slim

#make app directory inside contianer [cd app]
WORKDIR /app


#copy packges from local to container inside /app
COPY package.json .


#Install requriments and dependcies 
RUN npm install

#copy source code 
COPY . .

#expose app on port 3000
EXPOSE 3000


#start the server
CMD [ "node","index.js" ]