openresty_dynamic_router
========================

Openresty dynamic router with redis backend.

The router will lookup the request host from redis:

  openresty_dynamic_router 10.0.0.1
  yourdomain.com           10.0.0.1
  yourbackend.com       10.0.0.2

You create a key/value pair on redis: Key= "yourdomain.com" value="https://yourbackend.com:443" and when the router 
matches the request host with the redis key, will proxy_pass your request to the value... 

There's a simple api for creating dynamic endpoints running on port 8080, example:

curl -v "openresty_dynamic_router:8080/api/SECRET_TOKEN/set?key=yourdomain.com&val=https://yourbackend.com:443"

then just, curl yourdomain.com and you will get yourbackend.com, just make sure yourdomain.com is pointing to the openresty_dynamic_proxy host..
