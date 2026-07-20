---
title: "Homelab"
excerpt: "Documentation of my Selfhosting and Homelab Journey"
header:
    image: "/assets/images/portfolio/homelab/homelab-diagram.png"
    teaser: "/assets/images/portfolio/homelab/homelab-diagram.png"
sidebar:
    nav: "homelab"
---
# Summary
My homelab is cloud based infrastructure deployed in remote Linux VPS, I want to have my own infrastructure where I can manage, deploying and maintaining my own suite of application where I can access anywhere without vendor lock-in, with homelab I have freedom to build the infrastructure how I want and freely chossing my application to serve my needs.

I started my homelab journey after I am done internship as DevOps Engineer in May 2025. With homelab I can have place to try and practice suite of application I haven't done during my internship and try to expand my capabilities further. 

# State
Currently my homelab has serving multiple applications consist of 
- Core Service: [Forgejo](https://www.forgejo.org) as personal git server and This Personal Website. 
- Dedicated SourceGame Server: I run [community L4D2 Server](https://steamcommunity.com/groups/chiper-l4d2-server) each have their own mode and different configs.
- Reverse Proxy: Caddy to handle routing application and automatic SSL Certification.
- Monitoring and Observability: Prometheus and Grafana for resource and performance tracking.
Every service is isolated within Rootless Podman Containers to enforce a zero-trust security model at the OS level.

# My vision 
My goal for this infrastructure is to achieve near-zero operational overhead. The goal is a environment that requires minimal intervention, acting as a pipeline where new updates can progress from testing stages into production.
