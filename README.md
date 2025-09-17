# PaperPlane Docker Baseline-Node20 [![Build Status](https://drone.paperplane.cc/api/badges/paperplane-docker/baseline-node20/status.svg)](https://drone.paperplane.cc/paperplane-docker/baseline-node20)

本镜像 [`paperplanecc/baseline-node20`](https://hub.docker.com/r/paperplanecc/baseline-node20) 为 Node.js 和前端开发者提供开发镜像。点此访问 [源码](https://git.paperplane.cc/paperplane-docker/baseline-node20) 或 [GitHub 源码镜像](https://github.com/paperplane-docker/baseline-node20)。

镜像基于 `node:20-slim`，并预装 `pnpm`，CI/CD 任务会每周同步最新版本，并使用日期作为镜像的标签；此外，为了兼容 `Next.js` 等库，镜像中预装了 `canvas` 的依赖项，使它可以开箱即用；如果用到 `pnpm`，请留意自己项目中 `package.json` 的 `packageManager` 字段，如果此版本号不符合，可能报错。
