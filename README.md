# Nomad 0.10: Secure Service-to-Service Traffic with Consul Connect Integration

## Contents

This repository contains the demo used in the "Nomad 0.10: Secure Service-to-Service Traffic with Consul Connect Integration" webinar.
To walk through the demo, use the steps outlined in the Makefile:

```shell
# Set up Nomad cluster and Consul server.
make step1

# Open the Consul UI.
open localhost:8500
# Open the Nomad UI.
open localhost:4646
```

```shell
# Test bridge networking.
make step2

# Test the application. It should not work, because it's not exposed.
curl <alloc ip>:9090
```

```shell
# Test network namespaces with a static port.
make step3

# Test the application. It should now work, because we bound it to the host.
curl <alloc ip>:9090.
```

```shell
# Deploy monolithic application.
make step4

curl localhost:9090
```

```shell
# Deploy currency microservice.
make step5
```

```shell
# Try out the currency microservice.
make step6

curl localhost:9090

curl localhost:9090 -H 'group: dev'
```

```shell
# Deploy new payments service.
make step7
```

```shell
# Create 2 subsets for the payments service.
make step8
```

```shell
# A/B test new payments service.
make step9

curl localhost:9090

curl localhost:9090 -H 'group: test'
```

```shell
# Send 50% of the traffic to the canary release.
make step10

curl localhost:9090
```

```shell
# Send 100% of the traffic to the canary release.
make step11

curl localhost:9090
```

## Slides

The slides for the webinar can be found in the `slides` directory.
A link to the recording of the webinar will be added to the repository once it is available.
