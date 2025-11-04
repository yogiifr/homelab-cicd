# Build
FROM node:20-alpine AS builder
WORKDIR /app
COPY app/package*.json ./
RUN npm ci --omit=dev
COPY app/ .
EXPOSE 3000
RUN npm run build

# Serve 
FROM docker.io/nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
