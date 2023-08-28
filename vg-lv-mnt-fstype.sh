#############################################################################################################################################################
#Aurthor : Kishore                                                                                                                                          #
#Version:1.2                                                                                                                                                #
#                                                                                                                                                           #
#############################################################################################################################################################
#!/bin/bash

case $1 in
    vgcheck)
        echo " "
        echo "Gathering Volume Group Information"
        VGNAME="$2"
        echo " "
        echo " "
        if [[ $VGNAME == "" ]]; then
            echo "======================================================================================================================"
            echo "You haven't entered any volume group name, hence displaying all Volume Groups present on the servers"
            echo "======================================================================================================================"
            vgs | awk '{print $1}' | grep -v VG
        else
            echo "======================================================================================================================"
            echo "####################################Displaying $VGNAME Volume Group Information###################################"
            echo "======================================================================================================================"
            vgdisplay $VGNAME 2> /dev/null
            echo " "
            AVBLVG=($(vgs | awk '{print $1}' | grep -v VG))
        found=false
                for vg_name in "${AVBVG[@]}"; do
        if [[ "$MNTCHK" == "$vg_name" ]]; then
        found=true
        break
    fi
        done

        if [[ "$found" == false ]]; then
        echo " Does not exist provided input $VGNAME "
fi
        fi
        ;;
    lvcheck)
        echo " "
        echo "Gathering Logical Volume Information"
        LVNAME="$2"
        echo " "
        echo " "
        if [[ $LVNAME == "" ]]; then
            echo "======================================================================================================================="
            echo "You haven't entered any logical volume name, hence displaying all Logical Volumes present on the servers"
            echo "======================================================================================================================="
            lvdisplay | awk '/Path/ {print $0}' | cut -b 26-100
            echo " "
        else
            echo "======================================================================================================================="
            echo "####################################Displaying $LVNAME Logical Volume Information###################################"
            echo "======================================================================================================================="
            lvdisplay $LVNAME 2> /dev/null
            echo " "

AVBLLV=($(lvdisplay | awk '/Path/ {print $0}' | cut -b 26-100))
        found=false
                for lv_name in "${AVBLV[@]}"; do
        if [[ "$LVNAME" == "$lv_name" ]]; then
        found=true
        break
    fi
        done

        if [[ "$found" == false ]]; then
        echo " Does not exist provided input $LVNAME "
        fi
        fi
        ;;
mountchk)
    echo " "
    echo "Gathering All mounted file systems on the Server"
    MNTCHK="$2"
    echo " "
    echo " "

    if [[ $MNTCHK == "" ]]; then
        echo "======================================================================================================================="
        echo "       You haven't entered any Mount point name, hence displaying all Mounted file systems on the server"
        echo "======================================================================================================================="
        df -hTP | egrep -v 'tmpfs'
        echo " "
    else
        echo "======================================================================================================================="
        echo "####################################Displaying $MNTCHK File System mounted Information#################################"
        echo "======================================================================================================================="
        df -hTP | grep -w "$MNTCHK"
        echo " "
        AVBLMNT=($(df -hTP | awk '{print $1,$2,$7}' | grep -v Mounted))
        found=false
                for mount_point in "${AVBLMNT[@]}"; do
        if [[ "$MNTCHK" == "$mount_point" ]]; then
        found=true
        break
    fi
        done

        if [[ "$found" == false ]]; then
        echo " Does not exist provided input $MNTCHK"
fi
fi
    ;;


    *)
            echo -e " Please provide any one of the three below as a input which you desire \n 1) vgcheck \n 2) lvcheck \n 3) mountchk \n Provide sub input if you know such as vg name, lv name, partion name, mnt point name, fs type names after the above three input"
        ;;
esac
