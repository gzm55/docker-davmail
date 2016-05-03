# docker-davmail

A EWS proxy in docker. Run it like this:

```Bash
VPN_SERVER=<server-domain-or-ip>
VPN_USER=<user>
VPN_PASSWORD=<password>
VPN_ROUTING_IPS="172.0.0.0/8 www.google.com"
#VPN_PPP_OPTIONS=
#VPN_DEBUG=y

```Bash
docker run --net=host \
           --name davmail \
           -e DAVMAIL_URL=<url> \
           -e DAVMAIL_SERVER_CERTIFICATE_HASH=<optional-certificate-hash>
           -e DAVMAIL_NTLM_DOMAIN=<optional-windows-domain>
           -d \
           gzm55/pptp-client
```

Accepted docker environment variables:

* DAVMAIL_URL: server domain or ip
* DAVMAIL_SERVER_CERTIFICATE_HASH: optional, cirtificate hash, like 11:22:...
* DAVMAIL_NTLM_DOMAIN: optional, windows domain
* DAVMAIL_CONFIG_URL: a url for downloading a specific configuration, this can override all other options

Listened ports:

* caldav port: 1080
* imap port:   1143
* ldap port:   1389
* pop3 port:   1110
* smtp port:   1025
