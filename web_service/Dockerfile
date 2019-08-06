FROM node:8
WORKDIR /app
COPY package*.json ./
RUN npm install
RUN npm install node-fetch -s
COPY fetch-video.js ./
CMD ["node", "fetch-video.js"]
