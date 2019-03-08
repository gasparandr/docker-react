FROM node:alpine as builder

WORKDIR "/app"

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# NGINX 
FROM nginx

# ELASTICBEANSTALK PORT
EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html
