#clear log container
#mv /var/lib/docker/containers/fe72d642d388593fa85a033290319271552d57b947a0486739a07a1c05246859/fe72d642d388593fa85a033290319271552d57b947a0486739a07a1c05246859-json.log{.bak,}
mv /var/lib/docker/containers/container-id/container-id-json.log{.bak,}

#logs
docker logs <name_container>

#ps
docker ps -a --format "{{.ID}}\t{{.Names}}\t\t{{.Status}}\t{{.CreatedAt}}" --filter "name=-462"

#enter to bash in container
docker exec -t -i crm-dts-1 /bin/bash

#stop several containers with filter name of container
docker stop $(docker ps -a -q --filter "name=-462")

#copy file
#docker cp /folder/file.txt <container-id>:/host
docker cp ~/projects/helper/generate_orders.sql crm-postgres-1:/1.sql
