docker run -d  --cap-drop ALL --cap-add SETPCAP --cap-add SYS_PACCT --cap-add SYS_RESOURCE --cap-add AUDIT_WRITE --cap-add CHOWN \
--cap-add DAC_OVERRIDE --cap-add FOWNER --cap-add DAC_READ_SEARCH --cap-add FSETID --cap-add KILL --cap-add SETGID --cap-add SETUID \
--cap-add NET_BIND_SERVICE --cap-add NET_BROADCAST --cap-add SYS_CHROOT --cap-add SYS_PTRACE --cap-add SETFCAP --cap-add IPC_LOCK \
--cap-add NET_RAW --name=dss-test -e TZ=Etc/UTC -v /sys/kernel/debug:/sys/kernel/debug -v /etc/localtime:/etc/localtime:ro \
-v /etc/bluedata/sysconfig.clock:/etc/sysconfig/clock:ro -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /sys/fs/cgroup/systemd:/sys/fs/cgroup/systemd \
--security-opt label=disable --ulimit nproc=65536 --ulimit nofile=32768 --pids-limit 65536 --tmpfs /tmp:rw,exec,size=20G \
--tmpfs /run:rw,exec,size=20G $1
