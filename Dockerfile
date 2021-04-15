## Bulider State ##
FROM node:12 as Bulider

WORKDIR /app/web

COPY package.json ./

RUN npm install

COPY ./ ./

ENV CHOKIDAR_USEPOLLING=true

RUN npm run build


## Run Stage ##
FROM nginx

COPY --from=Bulider /app/web/build /usr/share/nginx/html
