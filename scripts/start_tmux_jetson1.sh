#!/bin/bash

LOG_FILE=/home/field/project11/log/start_tmux.txt

echo "" >> ${LOG_FILE}
echo "#############################################" >> ${LOG_FILE}
echo "Running start_tmux_jetson1.bash" >> ${LOG_FILE}
echo $(date) >> ${LOG_FILE}
echo "#############################################" >> ${LOG_FILE}
echo "" >> ${LOG_FILE}
echo "Logs:" >> ${LOG_FILE}

set -e

{
source /opt/ros/melodic/setup.bash
source /home/field/project11/catkin_ws/devel/setup.bash

export ROS_WORKSPACE=/home/field/project11/catkin_ws
export ROS_IP=192.168.100.114
export ROS_MASTER_URI=http://192.168.100.112:11311

} &>> ${LOG_FILE}

set -v

{
tmux new -d -s project11 rosrun rosmon rosmon --name=rosmon_ben_jetson1 ben_hardware jetson1.launch

} &>> ${LOG_FILE}