#!/usr/bin/env bash
# Since the 4 Mac mini M1 machines are plotting to /Volumes/chiaplot-ext-# and I don't want to mount any extra USB drives in this case I manually move plots from the /Volumes/chiaplot-ext-# to the other USB drives only mounted on Mac mini M1 #1 machine
# Send script to Mac mini #1:
# scp scripts/transporter.sh adminofthemac1@192.168.1.211:/Users/adminofthemac1/Documents/
# SCREEN -d -m -S sas1 bash -c '~/Documents/transporter.sh';screen -x sas1

# adding sleep just in case there's other network IO
NUM_PLOTS_TO_MOVE=4;
sleep 2;SRC_DRIVE="/Volumes/chiaplot-ext-1";DEST_DRIVE="/Volumes/chiasas1";pushd ${SRC_DRIVE};ls -Al plot-*.plot | tr -s ' ' | cut -f9- -d' ' | head -${NUM_PLOTS_TO_MOVE} > ${SRC_DRIVE}/_transporter_list.txt;popd;cat ${SRC_DRIVE}/_transporter_list.txt;rsync -aP --remove-source-files --files-from=${SRC_DRIVE}/_transporter_list.txt ${SRC_DRIVE} ${DEST_DRIVE};
echo "sleep";sleep 900;SRC_DRIVE="/Volumes/chiaplot-ext-2";DEST_DRIVE="/Volumes/chiasas1";pushd ${SRC_DRIVE};ls -Al plot-*.plot | tr -s ' ' | cut -f9- -d' ' | head -${NUM_PLOTS_TO_MOVE} > ${SRC_DRIVE}/_transporter_list.txt;popd;cat ${SRC_DRIVE}/_transporter_list.txt;rsync -aP --remove-source-files --files-from=${SRC_DRIVE}/_transporter_list.txt ${SRC_DRIVE} ${DEST_DRIVE};
echo "sleep";sleep 900;SRC_DRIVE="/Volumes/chiaplot-ext-3";DEST_DRIVE="/Volumes/chiasas1";pushd ${SRC_DRIVE};ls -Al plot-*.plot | tr -s ' ' | cut -f9- -d' ' | head -${NUM_PLOTS_TO_MOVE} > ${SRC_DRIVE}/_transporter_list.txt;popd;cat ${SRC_DRIVE}/_transporter_list.txt;rsync -aP --remove-source-files --files-from=${SRC_DRIVE}/_transporter_list.txt ${SRC_DRIVE} ${DEST_DRIVE};
echo "sleep";sleep 900;SRC_DRIVE="/Volumes/chiaplot-ext-4";DEST_DRIVE="/Volumes/chiasas1";pushd ${SRC_DRIVE};ls -Al plot-*.plot | tr -s ' ' | cut -f9- -d' ' | head -${NUM_PLOTS_TO_MOVE} > ${SRC_DRIVE}/_transporter_list.txt;popd;cat ${SRC_DRIVE}/_transporter_list.txt;rsync -aP --remove-source-files --files-from=${SRC_DRIVE}/_transporter_list.txt ${SRC_DRIVE} ${DEST_DRIVE};

