#!/bin/bash
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
