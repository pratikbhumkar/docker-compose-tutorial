FROM node:12-alpine AS development-env
ENV NODE_ENV=development
WORKDIR /app

ARG buildno
ARG userdefinedargument

RUN echo "Build number: $buildno"
RUN echo "A user defined argument: $userdefinedargument"

COPY package*.json ./
RUN yarn install
COPY . .

EXPOSE 3000
CMD ["node", "./bin/www"]

FROM development-env AS production-env
ENV NODE_ENV=production
WORKDIR /app

ARG buildno
ARG userdefinedargument

RUN echo "Build number: $buildno"
RUN echo "A user defined argument: $userdefinedargument"

COPY package*.json ./
RUN yarn install
COPY . .

EXPOSE 3000
CMD ["node", "./bin/www"]