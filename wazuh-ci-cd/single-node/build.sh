# 1. Obtener commit-hash
COMMIT_HASH=$(git rev-parse --short HEAD)
echo COMMIT_HASH: $COMMIT_HASH

# 2. Construir con docker-compose
docker-compose build --no-cache --pull

# 3. Etiquetar con commit-hash
docker image tag ghcr.io/syscon3/wazuh-manager:latest  ghcr.io/syscon3/wazuh-manager:$COMMIT_HASH
docker image tag single-node_wazuh.indexer ghcr.io/syscon3/wazuh-indexer:$COMMIT_HASH
docker image tag single-node_wazuh.dashboard ghcr.io/syscon3/wazuh-dashboard:$COMMIT_HASH

# 4. Push con commit-hash
docker push ghcr.io/syscon3/wazuh-manager:$COMMIT_HASH
docker push ghcr.io/syscon3/wazuh-indexer:$COMMIT_HASH
docker push ghcr.io/syscon3/wazuh-dashboard:$COMMIT_HASH

# 5. Push con latest
docker push ghcr.io/syscon3/wazuh-manager:latest
docker push ghcr.io/syscon3/wazuh-indexer:latest
docker push ghcr.io/syscon3/wazuh-dashboard:latest


#docker tag single-node_wazuh.manager ghcr.io/syscon3/wazuh-manager:latest
#docker tag single-node_wazuh.indexer ghcr.io/syscon3/wazuh-indexer:latest
#docker tag single-node_wazuh.dashboard ghcr.io/syscon3/wazuh-dashboard:latest
#docker push ghcr.io/syscon3/wazuh-manager:latest
#docker push ghcr.io/syscon3/wazuh-indexer:latest
#docker push ghcr.io/syscon3/wazuh-dashboard:latest

