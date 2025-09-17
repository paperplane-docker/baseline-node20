CALVER=$(date +%Y%m%d)
NODE_VERSION=$(docker run --rm curlimages/curl -s https://nodejs.org/dist/index.json | grep -o '"version":"v20[^"]*"' | head -1 | sed 's/"version":"v//;s/"//')
PNPM_VERSION=$(docker run --rm curlimages/curl -s https://registry.npmjs.org/pnpm/latest | grep -o '"version":"[^"]*' | cut -d'"' -f4)

COMBINE_VERSION="node${NODE_VERSION}-pnpm${PNPM_VERSION}"

if ! docker manifest inspect "paperplanecc/baseline-node20:$COMBINE_VERSION" > /dev/null 2>&1; then
  docker buildx build --platform linux/amd64,linux/arm64 --progress plain --compress --build-arg NODE_VERSION=$NODE_VERSION --build-arg PNPM_VERSION=$PNPM_VERSION -t paperplanecc/baseline-node20:$CALVER .

  docker login -u paperplanecc -p $DOCKER_PASS

  docker tag paperplanecc/baseline-node20:$CALVER paperplanecc/baseline-node20:latest
	docker tag paperplanecc/baseline-node20:$CALVER paperplanecc/baseline-node20:$COMBINE_VERSION

  docker push paperplanecc/baseline-node20:$CALVER
  docker push paperplanecc/baseline-node20:latest
	docker push paperplanecc/baseline-node20:$COMBINE_VERSION

  docker rmi paperplanecc/baseline-node20:$CALVER
  docker rmi paperplanecc/baseline-node20:latest
	docker rmi paperplanecc/baseline-node20:$COMBINE_VERSION
fi