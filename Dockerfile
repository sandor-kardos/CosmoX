FROM node:22 AS build
WORKDIR /app
COPY . .
RUN npm install vite cors
WORKDIR /app/client
RUN npm install && npm run build
FROM node:22
WORKDIR /app
COPY --from=build /app/package*.json ./
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/server ./server
COPY --from=build /app/shared ./shared
COPY --from=build /app/client ./client
EXPOSE 5000
CMD ["npx", "tsx", "server/index.ts"]
