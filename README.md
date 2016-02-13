# A vagrant setup ready to test for master/slave instances of Jenkins
Master/slave for Jenkins (ubuntu/trusty64 based)


To use it just launch


```bash
vagrant up
```

After that you can just set up the slave (jenkinslave.local) on the master with /var/lib/jenkins/ as directory and with master jenkins user for credentials.


Where to find it after *up* is finished : http://192.168.100.21:8080/