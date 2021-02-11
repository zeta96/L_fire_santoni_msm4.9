#!/system/bin/sh

#Uclamp tuning
sysctl -w kernel.sched_rt_default_util_clamp_min=500

#top-app
echo max > /dev/cpuset/top-app/uclamp.max
echo 85  > /dev/cpuset/top-app/uclamp.min
echo 1   > /dev/cpuset/top-app/uclamp.boosted 
echo 0   > /dev/cpuset/top-app/uclamp.latency_sensitive 

#foreground
echo 50 > /dev/cpuset/foreground/uclamp.max
echo 20 > /dev/cpuset/foreground/uclamp.min
echo 0  > /dev/cpuset/foreground/uclamp.boosted
echo 0  > /dev/cpuset/foreground/uclamp.latency_sensitive

#background
echo max > /dev/cpuset/background/uclamp.max
echo 20  > /dev/cpuset/background/uclamp.min
echo 0   > /dev/cpuset/background/uclamp.boosted
echo 0   > /dev/cpuset/background/uclamp.latency_sensitive

#system-background
echo 50 > /dev/cpuset/system-background/uclamp.max
echo 10 > /dev/cpuset/system-background/uclamp.min
echo 0  > /dev/cpuset/system-background/uclamp.boosted
echo 0  > /dev/cpuset/system-background/uclamp.latency_sensitive
