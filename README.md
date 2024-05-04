# Western Digital Hugo in Docker

Run the WD Hugo util inside of Docker. Useful if the host cannot run the binary, like on Debian Trixie.

## Guide

Build docker image

```
$ ./build.sh
# OR
$ docker build -t wd-hugo .
```

Start docker with the SG device, not the block device.

```
$ lsscsi --generic
[0:0:12:0]   disk    ATA      HUH721212ALE601  0002  /dev/sdm   /dev/sg13
[0:0:13:0]   disk    ATA      HUH721212ALE601  0002  /dev/sdn   /dev/sg14

$ ./run-with-devices.sh /dev/sg12 /dev/sg13

# OR

$ docker run --device /dev/sg12 --device /dev/sg13 --network none --rm -it wd-hugo /bin/bash

# OR (lazy)

$ docker run --privileged --network none --rm -it wd-hugo /bin/bash
```

Now can run hugo

```
root@0f720306a907:/hugo# ./hugo show

     Manuf.       Model               Serial                Interface       Capacity  Type  Firmware
----------------------------------------------------------------------------------------------------
  1) HGST         HUH721212ALE601     XXXXXXXX              SATA            12000 GB  HDD   LEGL0002
  2) HGST         HUH721212ALE601     XXXXXXXX              SATA            12000 GB  HDD   LEGL0002

$ ./hugo format --fastformat --blocksize 4096 --target /dev/sg13
```

Hugo mirrored from https://archive.org/details/wdc-hugo
