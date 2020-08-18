---
title: "Pingr - Monitor the health and status of your services"
date: 2020-08-18T10:47:41Z
draft: false
author: "Agaton Sjöberg"
---
With more and more of our time being spent online, we have been increasingly spoiled by low response times and 
constant uptime. To fulfil internal and external demands at businesses, it is therefore more important than ever
to ensure that your services perform as expected. Here to help you, I present Pingr. 

<!--more-->

### What is Pingr?

Pingr is designed to monitor your services and let you know whenever a service is behaving unexpectedly. It does
so by poll and push tests. Pingr will poll your services using various different methods such as HTTP-requests or
an ordinary ping. By polling every X seconds, Pingr will monitor your response times as well as any error related
behaviour. Push tests expect your service to poll Pingr using HTTP atleast every Y seconds. In case an error is 
thrown, Pingr can contact you via email or post-hook.

At [Modular Finance](https://modularfinance.se/?l=en) we use Pingr in conjunction with 
[Callr](https://github.com/itsy-sh/callr). Callr let’s you call someone whenever a post request is received. 
This means that Pingr can email you when minor errors occur and call you, through Callr, whenever some urgent 
error occurs etc. Being a firm that has multiple services deployed, the Pingr and Callr combo, solves the issues of 
manually monitoring the health of all these services and let’s you sleep, or not, through an entire night, knowing 
that your services are behaving as they should.

### Test methods
**Poll methods**
+ DNS
+ HTTP
+ Ping
+ Prometheus
+ SSH
+ TCP
+ TLS/SSL

**Push methods**
+ HTTP
+ Prometheus

Visit our [github](https://github.com/itsy-sh/pingr) to learn more.

