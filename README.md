Apache SkyWalking Kong Agent
==========

<img src="http://skywalking.apache.org/assets/logo.svg" alt="Sky Walking logo" height="90px" align="right" />

[![Twitter Follow](https://img.shields.io/twitter/follow/asfskywalking.svg?style=for-the-badge&label=Follow&logo=twitter)](https://twitter.com/AsfSkyWalking)

![E2E](https://github.com/apache/skywalking-kong/workflows/e2e/badge.svg?branch=master)

SkyWalking Kong agent built on [SkyWalking Nginx Lua agent](https://github.com/apache/skywalking-nginx-lua) to trace Kong API gateway for [Apache SkyWalking](https://github.com/apache/skywalking) APM.


## Usage

1. Install the plugin in Kong:

Install kong-plugin-skywalking using `luarocks`:
```bash
$ luarocks install kong-plugin-skywalking --local
```

Edit kong.conf:
```
plugins = bundled,skywalking

lua_package_path = ${user.home}/.luarocks/share/lua/5.1/?.lua;;
```

Set environment:
```bash
$ export KONG_NGINX_HTTP_LUA_SHARED_DICT="tracing_buffer 128m"
```

Restart Kong

2. Enabling & configuring plugin:

Add the plugin to a service:

```bash
$ curl -i -X POST \
   --url http://localhost:8001/services/{service_name}/plugins/ \
   --data 'name=skywalking' \
   --data 'config.backend_http_uri=http://localhost:12800' \
   --data 'config.sample_ratio=100' \
   --data 'config.service_name=kong'
   --data 'config.service_instance_name=kong-with-skywalking'
``` 

Add the plugin to global:
```bash
$ curl -X POST --url http://localhost:8001/plugins/ \
   --data 'name=skywalking' \
   --data 'config.backend_http_uri=http://localhost:12800' \
   --data 'config.sample_ratio=100' \
   --data 'config.service_name=kong'
   --data 'config.service_instance_name=kong-with-skywalking'
```

# Contact Us
* Submit an [issue](https://github.com/apache/skywalking/issues) with `[KONG]` as the issue title prefix.
* Mail list: **dev@skywalking.apache.org**. Mail to `dev-subscribe@skywalking.apache.org`, follow the reply to subscribe the mail list.
* Join `skywalking` channel at [Apache Slack](https://join.slack.com/t/the-asf/shared_invite/enQtNzc2ODE3MjI1MDk1LTAyZGJmNTg1NWZhNmVmOWZjMjA2MGUyOGY4MjE5ZGUwOTQxY2Q3MDBmNTM5YTllNGU4M2QyMzQ4M2U4ZjQ5YmY). If the link is not working, find the latest one at [Apache INFRA WIKI](https://cwiki.apache.org/confluence/display/INFRA/Slack+Guest+Invites).
* QQ Group: 392443393(2000/2000, not available), 901167865(available)

# License
Apache 2.0
