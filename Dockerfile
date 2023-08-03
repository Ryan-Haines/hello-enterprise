# Start with the latest Node.js image to build React app
FROM node:latest AS build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Use Nginx image to serve the built app
FROM nginx:alpine
COPY --from=build-stage /app/build /usr/share/nginx/html
