FROM node:alpine as builder
WORKDIR /app/frontend
COPY package.json .
RUN npm install
COPY . .
CMD ["npm","build"]

FROM nginx as run
COPY --from=builder /app/frontend/build /usr/share/nginx/html