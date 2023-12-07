# using a smaller version of node image
FROM node:18-alpine 

WORKDIR /app

COPY package*.json ./

RUN npm install

# Copy all other files in the project directory
COPY . . 

EXPOSE 3000

CMD ["node", "index.js"]