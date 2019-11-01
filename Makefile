.PHONY: cluster monolith

# Spin up Nomad cluster on Docker compose
step1: cluster monolith

cluster:
	cd cluster && \
	docker-compose up -d
destroy-cluster:
	cd cluster && \
	docker-compose down

monolith:
	nomad run api.nomad
	nomad run payments.nomad

armageddon:
	docker ps -aq | xargs docker rm -f || true
	docker network ls -q | xargs docker network rm || true
	docker volume ls -q | xargs docker volume rm || true
