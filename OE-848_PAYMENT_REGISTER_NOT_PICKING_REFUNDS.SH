#!/bin/sh
#--------------------------------------------------------------------------
#  File name       : OE-848_PAYMENT_REGISTER_NOT_PICKING_REFUNDS.sh
#
#  Author          : Akash Verma
#
#  Created         : 07-MAY-2018
#
#  Description     : Shell script to migrate objects
#					 This will copy the files to the respective locations
#					 in the server.
#  Modifications   :
#
#  ------------------------------------------------------------------------
#  Revision		Date		Author			Version
#  ------------------------------------------------------------------------
#1.0			07-MAY-2018	Akash Verma		Base Version
#--------------------------------------------------------------------------

clear

START_DIR=`pwd` ;

echo "Current Directory: $START_DIR";

LOGFILE=OE-848_PAYMENT_REGISTER_NOT_PICKING_REFUNDS.log

do_log()
{
 echo "" | tee -a $LOGFILE
 echo " " $1 | tee -a $LOGFILE
 #echo " ---------------------------------------------------" | tee -a $LOGFILE
}

echo "Copying objects to the respective directories in the custom top"
echo "Copying the Files to their corresponding Folders ..." | tee -a $LOGFILE

#---------------------------------------------------
echo "--- home directory to Required Top " | tee -a $LOGFILE
#---------------------------------------------------


# *******************************************************************
#  Prompt for Instance Name
# *******************************************************************
    if [ "$INST_NAME" = "" ];then
            echo "# ******************************************************************* #" 
            echo "   Enter Instance Name : "                                     
            read INST_NAME
     else
          echo  "# ******************************************************************* #"   
          echo "   Instance Name is not CORRECT "                          
          #echo  "# ******************************************************************* #"   
          INST_NAME=""
    fi

# *******************************************************************
#  Prompt for APPS Login Id /Password
# *******************************************************************
    if [ "$APPSID" = "" ];then
            echo "# ******************************************************************* #" 
            echo "   Enter APPS Login Userid/Passwd : "                                     
            read APPSID
     else
          echo  "# ******************************************************************* #"   
          echo "   APPS Login Userid and Password is not CORRECT "                          
          #echo  "# ******************************************************************* #"   
          APPSID=""
    fi
APPS_USER=`echo $APPSID | awk -F"/" '{print $1}'`

echo "APPS login= $APPSID@$INST_NAME"

# *******************************************************************
#  Copy .rdf to ACS_TOP/reports/US
# *******************************************************************


echo "cp ACS_PAYMENT_REGISTER.rdf $ACS_TOP/reports/US...."  

cp ACS_PAYMENT_REGISTER.rdf $ACS_TOP/reports/US
     

echo "Successfully copied all the files ..."  

do_log "Uploading complete. Please check the log files.."
