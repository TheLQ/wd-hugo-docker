device_args=""
for i in $*; do
	device_args="$device_args --device $i"
done

set -x
exec docker run $device_args --network none --rm -it wd-hugo /bin/bash
