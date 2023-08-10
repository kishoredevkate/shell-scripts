#!/bin/bash
###########################################################################################################
#About Script: This script can be used for view the Volume Groups, logical volume groups and mount points #
#Author: Kishore Devkate                                                                                  #
#Version of script : 1.0                                                                                  #
#Details how to use the script:                                                                           #
# at command promt : bash filename.sh vgcheck                                                             #
#                    bash filename.sh lvcheck                                                             #
#                    bash filename.sh mountcheck                                                          #
###########################################################################################################
case $1 in
        vgcheck)
                echo "======================================"
                echo "==Below are the Volume Group Details=="
                echo "======================================"
                echo " "
                echo "$(vgs |awk '{print $1,$6,$7}')"
                ;;
        lvcheck)
                echo "========================================"
                echo "==Below are the Logical Volume Details=="
                echo "========================================"
                echo " "
                echo "$(lvs  |awk '{print $1, $2, $4}')"
                ;;
        mountcheck)
                echo "===================================================="
                echo "==Below are the exited mounted file system Details=="
                echo "===================================================="
                echo " "
                echo "$(df -hTP |awk '!/tmpfs/ {print $1, $2, $3, $4, $5, $6, $7}')"
                ;;

              *)
                echo "invalid input"
                ;;
esac
