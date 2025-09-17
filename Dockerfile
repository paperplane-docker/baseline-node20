ARG NODE_VERSION=20
FROM node:${NODE_VERSION}-slim

RUN apt-get update && \
  apt-get install -y build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev --no-install-recommends && \
  apt-get clean

ARG PNPM_VERSION=latest
RUN corepack enable && \
  corepack prepare pnpm@${PNPM_VERSION} --activate

ENV PNPM_HOME=/usr/local/pnpm
ENV PATH="${PNPM_HOME}/bin:${PATH}"
RUN pnpm config set global-bin-dir ${PNPM_HOME}/bin

ARG PNPM_REGISTRY=https://registry.npmjs.org
RUN pnpm config set registry ${PNPM_REGISTRY}