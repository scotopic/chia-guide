#!/usr/bin/env bash
# Since the 4 Mac mini M1 machines are plotting to /Volumes/chiaplot-ext-# and I don't want to mount any extra USB drives in this case I manually move plots from the /Volumes/chiaplot-ext-# to the other USB drives only mounted on Mac mini M1 #1 machine
# Send script to Mac mini #1:
# scp scripts/transporter.sh adminofthemac1@192.168.1.211:/Users/adminofthemac1/Documents/
# Start transporter in the background:
# sh -c './transporter.sh' & jobs

sleep 0;    SRC_DRIVE="/Volumes/chiaplot-ext-1";DEST_DRIVE="/Volumes/chia-xt-2-3";SCREEN_NAME="tr1"; pushd ${SRC_DRIVE};ls -Al plot-*.plot | tr -s ' ' | cut -f9- -d' ' | head -5 > ${SRC_DRIVE}/_transporter_list.txt;popd;cat ${SRC_DRIVE}/_transporter_list.txt;SCREEN -d -m -S $SCREEN_NAME bash -c 'rsync -aP --remove-source-files --files-from='${SRC_DRIVE}'/_transporter_list.txt '${SRC_DRIVE}' '${DEST_DRIVE}''; screen -ls

sleep 3600; SRC_DRIVE="/Volumes/chiaplot-ext-2";DEST_DRIVE="/Volumes/chia-xt-2-3";SCREEN_NAME="tr2"; pushd ${SRC_DRIVE};ls -Al plot-*.plot | tr -s ' ' | cut -f9- -d' ' | head -5 > ${SRC_DRIVE}/_transporter_list.txt;popd;cat ${SRC_DRIVE}/_transporter_list.txt;SCREEN -d -m -S $SCREEN_NAME bash -c 'rsync -aP --remove-source-files --files-from='${SRC_DRIVE}'/_transporter_list.txt '${SRC_DRIVE}' '${DEST_DRIVE}''; screen -ls

sleep 3600; SRC_DRIVE="/Volumes/chiaplot-ext-3";DEST_DRIVE="/Volumes/chia-xt-2-3";SCREEN_NAME="tr3"; pushd ${SRC_DRIVE};ls -Al plot-*.plot | tr -s ' ' | cut -f9- -d' ' | head -5 > ${SRC_DRIVE}/_transporter_list.txt;popd;cat ${SRC_DRIVE}/_transporter_list.txt;SCREEN -d -m -S $SCREEN_NAME bash -c 'rsync -aP --remove-source-files --files-from='${SRC_DRIVE}'/_transporter_list.txt '${SRC_DRIVE}' '${DEST_DRIVE}''; screen -ls

sleep 3600; SRC_DRIVE="/Volumes/chiaplot-ext-4";DEST_DRIVE="/Volumes/chia-xt-2-3";SCREEN_NAME="tr4"; pushd ${SRC_DRIVE};ls -Al plot-*.plot | tr -s ' ' | cut -f9- -d' ' | head -5 > ${SRC_DRIVE}/_transporter_list.txt;popd;cat ${SRC_DRIVE}/_transporter_list.txt;SCREEN -d -m -S $SCREEN_NAME bash -c 'rsync -aP --remove-source-files --files-from='${SRC_DRIVE}'/_transporter_list.txt '${SRC_DRIVE}' '${DEST_DRIVE}''; screen -ls
