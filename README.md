Overview
========

Docker image for Asterisk.

Building
========

```docker build -t <username>/asterisk```

Running
=======

* The image exposes Openhab ports 5060 and 9001 (supervisord).
* It expects you to make a configurations directory on the host to /etc/asterisk/.  This allows you to inject your asterisk configuration into the container (see example below).
* The container supports starting without network (--net="none"), and adding network interfaces using pipework.
* If you need to set the timezone for the container, use the -v option to map the hosts /etc/timezone file to the containers'.

Example run command:
```docker -d -p 5060:5060 -v /etc/asterisk:/etc/asterisk tdeckers/asterisk```

