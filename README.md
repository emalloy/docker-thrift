# docker-thrift

## apache hbase and thrift dockerfile
_for use by a kubernetes `deployment` using a custom `hbase-site.xml` injected from a `configmap` via `volumemount`_

### Use-case description:

I was needing a way to keep default hbase/conf folder intact while being able to inject a custom `hbase-site.xml` file into said folder.
I was acheiving the injection by ways of a kubernetes `volumeMount` via `mountPath` and didn't want to wipe out the entire conf folder, so this 
custom docker image basically has this entrypoint that checks for the existence of the file at a target and symlinks it then starts thrift. If the file doesn't exist, well then you still thrift.



### Usage Ex:

```
docker build --build-arg HBASE_VERSION=1.3.1 -t docker-thrift:1.3.1 .
```
