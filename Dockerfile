FROM node:20-slim

RUN corepack enable
RUN corepack prepare pnpm@^10 --activate