FROM node:alpine
WORKDIR /app/frontend
COPY package.json .
RUN npm install
COPY . .
CMD ["npm","build"]

FROM nginx
COPY --from=0 /app/frontend/build /usr/share/nginx/html