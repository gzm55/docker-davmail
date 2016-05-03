# docker-davmail

A EWS proxy in docker. Run it like this:

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
* DAVMAIL_SSL_PASS: optional, set to the password of a PKCS12 SSL file

Listened ports:

* caldav port: 1080
* imap port:   1143
* ldap port:   1389
* pop3 port:   1110
* smtp port:   1025

Volume:

* "/etc/davmail/davmail.p12": if DAVMAIL_SSL_PASS is not empty, use this as the keystore file of type PKCS12
