#!/bin/bash
LOG="database_wifi.txt"
GATEWAY="192.168.1.1"
JARINGAN="192.168.1.0/24"

echo "Patroli dimulai jam $(date +%H:%M)..." 
nmap -sn $JARINGAN -oG - | grep "Up" | awk '{print $2}' > scan_baru.txt
BARU=$(diff $LOG scan_baru.txt 2>/dev/null | grep ">" | wc -l)

if [ $BARU -gt 0 ]; then
    echo "🚨 WASPADA! ADA DEVICE BARU NYOLOK 🚨"
    termux-media-player play /system/media/audio/ringtones/Over_the_Horizon.ogg
    termux-notification --title "SATPAM WIFI" --content "Ada $BARU device baru nyolok!"
else
    echo "Aman murid, nggak ada maling baru."
fi
cp scan_baru.txt $LOG
echo "Scan selesai."
