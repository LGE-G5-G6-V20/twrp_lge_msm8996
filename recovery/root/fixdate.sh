#!/sbin/ash
#This script fixes the time in TWRP for stock rom users
#stock and Lineage seem to produce ats files with different epochs and by default
#I made Lineage's time accurate

until pids=$(pidof recovery)
do
    sleep 1
done
sleep 3

export year=`date +%Y`
if [ $year -lt 2000 ]
then
export year=`expr $year + 46`
date $(date +%m%d%H%M)$year
exec /sbin/ash /fixdate.sh
fi
