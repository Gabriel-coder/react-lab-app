# Etapa 1: build da aplicação
FROM node:18-alpine AS build

WORKDIR /app
COPY react-lab-app/ .

RUN npm install
RUN npm run build

# Etapa 2: imagem final
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
