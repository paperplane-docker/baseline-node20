FROM node:20-slim

RUN corepack enable
RUN corepack prepare pnpm@^10 --activate

RUN apt-get install -y build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev --no-install-recommends