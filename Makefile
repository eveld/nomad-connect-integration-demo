.PHONY:
# Spin up Nomad cluster on Docker compose

# Destroy everything...
armageddon:
	docker ps -aq | xargs docker rm -f || true
	docker network ls -q | xargs docker network rm || true
	docker volume ls -q | xargs docker volume rm || true
