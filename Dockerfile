FROM registry.access.redhat.com/ubi8/nodejs-16

RUN npm install -g yarn

WORKDIR ${APP_ROOT}

COPY --chown=default:root package.json yarn.lock ./
RUN yarn install
COPY --chown=default:root . ./
RUN yarn build

EXPOSE 4000
CMD ["yarn", "run", "server"]
