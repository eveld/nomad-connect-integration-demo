# Nomad 0.10: Secure Service-to-Service Traffic with Consul Connect Integration

## Step 1
Create nomad cluster
Create consul cluster

## Step 2
Run a traditional application with old configuration

## Step 3
Add network stanza to use bridge networking

## Step 4
Add sidecar stanza to get sidecar service

## Step 5
Add a static port to expose the application on the host

## Step 6
Show capabilities of service mesh

- Canary release
- Route traffic to other services
- Show migration




- newly announced features:
    - storage
    - ui enhancements
    - networking
    - connect integration
- how does the networking work?
    - CNI
    - stanza
    - modes
    - static ports
- how does connect work?
    - what is a service mesh? control plane vs data plane
    - sidecar injection
    - service discovery
    - security
    - nomad sidecar stanza
- service mesh features
    - discovery chain
    - service router
    - service resolver
    - service splitter
- demo
    - explain the scenario we want to go through
        1. monolithic application, with the old service stanza
        2. change the configuration to talk to localhost and add a sidecar service
        3. break out micro-service, add service router to test if it works
        4. deploy payments v2, add service resolver, update service router
        5. add service splitter and slowly migrate to canary
    - show the architecture
    - do the demo
