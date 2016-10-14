* this documentation is not complete*

### Mount an ebs volume:

On the container:

```bash
$ sudo mkdir /mnt/ocpu
$ sudo chown `whoami` /mnt/ocpu
$ sudo mount /dev/xvdf /mnt/ocpu
```

it seems that docker needs to be restarted to make this directory available
within the container:

```bash
$ sudo service docker restart && sudo start ecs
```

see: https://forums.aws.amazon.com/thread.jspa?threadID=214845
see: https://github.com/aws/amazon-ecs-agent/issues/62#issuecomment-98378239

## Local setup:

$ docker pull opencpu/base

$ docker run --name rlibs -v ~/R/x86_64-pc-linux-gnu-library/3.3:/mnt/libraries alpine:latest echo "Libraries Mounted"

$ docker run --name rapp -it --volumes-from=rlibs opencpu/base

## todo in libs:
$ ln -s /mnt/libraries/* /usr/lib/opencpu/library/



#Deployment




