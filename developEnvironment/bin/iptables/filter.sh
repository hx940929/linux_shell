#!/usr/bin/bash

*filter
:INPUT DROP [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [1610:336523]
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 41017 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 3389 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 8888 -j ACCEPT
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 2181 -j ACCEPT
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 8080 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 443 -j ACCEPT
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 9000 -j ACCEPT
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 8443 -j ACCEPT
-A INPUT -s 10.193.2.205/32 -m limit --limit 3/hour
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 7070 -j ACCEPT
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 1113 -j ACCEPT
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 6379 -j ACCEPT
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 3306 -j ACCEPT
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 445 -j ACCEPT
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 139 -j ACCEPT
-A INPUT -p gre -j ACCEPT
-A INPUT -p tcp -m tcp --dport 1723 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 47 -j ACCEPT
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 20 -j ACCEPT
-A INPUT -s 10.193.2.0/24 -p tcp -m tcp --dport 21 -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m tcp --dport 80 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -s 10.193.2.0/24 -d 10.193.1.0/24 -j ACCEPT
-A FORWARD -s 10.193.1.0/24 -d 10.193.2.0/24 -j ACCEPT
-A FORWARD -s 10.193.2.0/24 -d 10.193.2.0/24 -j ACCEPT
-A FORWARD -s 10.193.2.51/32 -d 0.0.0.0/32 -j ACCEPT
COMMIT