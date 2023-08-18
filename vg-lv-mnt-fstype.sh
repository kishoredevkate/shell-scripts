#############################################################################################################################################################
#Aurthor : Kishore                                                                                                                                          #
#Version:1.1                                                                                                                                                #
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
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "You haven't entered any volume group name, hence displaying all Volume Groups present on the servers"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            vgs | awk '{print $1}' | grep -v VG
            echo "###################################################################################################################"
        else
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "####################################Displaying $VGNAME Volume Group Information###################################"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            vgdisplay $VGNAME
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        fi
        ;;
    lvcheck)
        echo " "
        echo "Gathering Logical Volume Information"
        LVNAME="$2"
        echo " "
        echo " "
        if [[ $LVNAME == "" ]]; then
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "You haven't entered any logical volume name, hence displaying all Logical Volumes present on the servers"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            lvdisplay | awk '/Path/ {print $0}' | cut -b 26-46
            echo "#######################################################################################################################"
        else
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "####################################Displaying $LVNAME Logical Volume Information###################################"
 echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            lvdisplay $LVNAME
            echo " "
        fi
        ;;
         mountchk)
        echo " "
        echo "Gathering Mount Point Information"
        MNTCHK="$2"
        echo " "
        echo " "
        if [[ $MNTCHK == "" ]]; then
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "You haven't entered any mount point name, hence displaying all mount points present on the servers"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            df -hTP |egrep -v 'tmpfs'
            echo "#######################################################################################################################"
        else
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            echo "####################################Displaying $MNTCHK Mount Point Information###################################"
            echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
            df -hTP |grep -w $MNTCHK
            echo " "
        fi
        ;;

    *)
        echo "Invalid Option Selected"
        ;;
esac
                
