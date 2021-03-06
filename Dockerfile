FROM node:8.9-alpine
ENV NODE_ENV production
ENV WORK_DIR=usr/elrapp/
ENV APP_DIR=app/
RUN mkdir -p ${WORK_DIR}${APP_DIR}
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3001
CMD npm start