# 1. Obtener commit-hash
COMMIT_HASH=$(git rev-parse --short HEAD)
echo COMMIT_HASH: $COMMIT_HASH

# 2. Construir con docker-compose
docker-compose build

# 3. Etiquetar con commit-hash
docker tag single-node_wazuh.manager ghcr.io/syscon3/wazuh-manager:$COMMIT_HASH
docker tag single-node_wazuh.indexer ghcr.io/syscon3/wazuh-indexer:$COMMIT_HASH
docker tag single-node_wazuh.dashboard ghcr.io/syscon3/wazuh-dashboard:$COMMIT_HASH

# 4. Push con commit-hash
docker push ghcr.io/syscon3/wazuh-manager:$COMMIT_HASH
docker push ghcr.io/syscon3/wazuh-indexer:$COMMIT_HASH
docker push ghcr.io/syscon3/wazuh-dashboard:$COMMIT_HASH

# 5. Tag de 'latest'
docker tag mi-imagen:$COMMIT_HASH ghcr.io/tu-org/mi-imagen:latest
docker tag ghcr.io/syscon3/wazuh-manager:$COMMIT_HASH ghcr.io/syscon3/wazuh-manager:latest
docker tag ghcr.io/syscon3/wazuh-indexer:$COMMIT_HASH ghcr.io/syscon3/wazuh-indexer:latest
docker tag ghcr.io/syscon3/wazuh-dashboard:$COMMIT_HASH ghcr.io/syscon3/wazuh-dashboard:latest

# 6. Push con latest
docker push ghcr.io/syscon3/wazuh-manager:latest
docker push ghcr.io/syscon3/wazuh-indexer:latest
docker push ghcr.io/syscon3/wazuh-dashboard:latest


#docker tag single-node_wazuh.manager ghcr.io/syscon3/wazuh-manager:latest
#docker tag single-node_wazuh.indexer ghcr.io/syscon3/wazuh-indexer:latest
#docker tag single-node_wazuh.dashboard ghcr.io/syscon3/wazuh-dashboard:latest
#docker push ghcr.io/syscon3/wazuh-manager:latest
#docker push ghcr.io/syscon3/wazuh-indexer:latest
#docker push ghcr.io/syscon3/wazuh-dashboard:latest

