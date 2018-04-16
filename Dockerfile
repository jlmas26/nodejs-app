FROM node

LABEL maintainer="Jorge Santos <jlmas26@gmail.com>"

RUN npm install npm@latest -g

RUN mkdir /src

WORKDIR /src
COPY app/package.json package.json
COPY app/server.js server.js
RUN npm install

EXPOSE 8080

CMD ["npm","start"]
