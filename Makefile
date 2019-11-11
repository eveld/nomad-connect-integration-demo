.PHONY: setup

step1: setup
step2: network
step3: static
step4: monolith
step5: currency
step6: payments-router
step7: payments-v2
step8: payments-v2-resolver
step9: payments-v2-router
step10: payments-v2-splitter
step11: payments-v2-splitter-100

# Spin up Nomad cluster on Docker compose.
# Run a connect job on all nodes to work around a bug currently present in CNI.
setup:
	cd setup && \
	docker-compose up -d
	sleep 5
	nomad run setup/nomad_jobs/cleanup.hcl
	sleep 10
	nomad stop -purge cleanup

# Show Network Namespaces.
network:
	nomad run bridge_network/api.hcl

static:
	nomad run static_port/api.hcl


# Start with a monolithic application.
monolith: api payments

api:
	nomad run monolith/api.hcl

payments:
	nomad run monolith/payments.hcl

# Deploy the first microservice.
currency:
	nomad run currency_microservice/currency.hcl

payments-router:
	consul config write currency_microservice/payments-router.hcl

# A/B test the currency microservice.
payments-v2:
	nomad run payments_v2/payments.hcl

payments-v2-resolver:
	consul config write payments_v2/payments-resolver.hcl

payments-v2-router:
	consul config write payments_v2/payments-router.hcl

# Canary release.
payments-v2-splitter:
	consul config write canary_release/payments-splitter-50.hcl

payments-v2-splitter-100:
	consul config write canary_release/payments-splitter-100.hcl

# Destroy everything...Including other Docker things!
armageddon:
	docker ps -aq | xargs docker rm -f || true
	docker network ls -q | xargs docker network rm || true
	docker volume ls -q | xargs docker volume rm || true