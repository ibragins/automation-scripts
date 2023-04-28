# automation-scripts
Purpose of this repo is to share scripts making life easier.
Below is current list of scripts with usage tips:
+ __bounce_tackle_pods__  
Bouncing tackle pods.  
In Tackle sometimes we need to bounce pods to make tackle to download latest version.  
__Usage:__ Login to the cluster and run this script.
__IMPORTANT:__ Operator will not be updated. Please redeploy tackle if you need to update operator as well.  
_____________________
+ __get_rhv_sert.sh__  
It is getting SSL certificate of RHV cluster.  
__Usage:__ run script and use IP of RHV cluster as a parameter.
_____________________
+ __get_vmware_sert.sh__  
It is getting SSL certificate of VMWare cluster.  
__Usage:__ run script and use IP of VMWare cluster as a parameter.  
_____________________
+ __getpass_keycloak__  
It will bring you back admin's password to login to keycloak admin console of Tackle.  
__Usage:__ Just run the script, no parameters required.
_____________________