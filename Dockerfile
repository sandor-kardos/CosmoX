FROM node:22 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npx esbuild server/index.ts --platform=node --packages=external --bundle --format=esm --outdir=dist

FROM node:22
WORKDIR /app
RUN mkdir -p /app/data
COPY --from=build /app/package*.json ./
COPY --from=build /app/node_modules ./node_modules
COPY --from=build /app/dist ./dist
COPY --from=build /app/client/dist ./client/dist
EXPOSE 5000
CMD ["node", "dist/index.js"]
