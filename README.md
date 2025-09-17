# 此仓库已废弃

现在 Node.js 的 Baseline 系列镜像已转移至 [paperplane-docker/baseline-node](https://github.com/paperplane-docker/baseline-node) 仓库。

# PaperPlane Docker Baseline-Node20

本镜像 [`paperplanecc/baseline-node20`](https://hub.docker.com/r/paperplanecc/baseline-node20) 为 Node.js 和前端开发者提供开发镜像。

- 镜像基于 `node:20-slim`，并通过 `corepack` 开启了 `pnpm`；
- 为了兼容 `Next.js` 等库，镜像中预装了 `canvas` 的依赖项，使它可以开箱即用。
