docker-compose build  # Construye las imágenes locales
docker tag single-node_wazuh.manager ghcr.io/syscon3/wazuh-manager:latest
docker tag single-node_wazuh.indexer ghcr.io/syscon3/wazuh-indexer:latest
docker tag single-node_wazuh.dashboard ghcr.io/syscon3/wazuh-dashboard:latest

docker push ghcr.io/syscon3/wazuh-manager:latest
docker push ghcr.io/syscon3/wazuh-indexer:latest
docker push ghcr.io/syscon3/wazuh-dashboard:latest

