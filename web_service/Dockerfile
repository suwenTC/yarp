FROM node:8
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install node-fetch -s
COPY fetch.js ./
CMD ["node", "fetch.js"]
