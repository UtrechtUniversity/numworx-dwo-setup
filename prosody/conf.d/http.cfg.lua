-- http settings
http_ports = { 80 }
http_interfaces = { "*", "::" }

https_ports = { 443 }
https_interfaces = { "*", "::" }

cross_domain_websocket = { "https://app.numworx", "http://app.numworx", "http://localhost", "https://localhost" }
consider_websocket_secure = true 

