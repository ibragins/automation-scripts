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
+ __getpass__  
It will bring you back admin's password to login to OCP cluster's console.  
__Usage:__ Run the script with the desired cluster name as parameter
_____________________
+ __getpass_keycloak__  
It will bring you back admin's password to login to keycloak admin console of Tackle.  
__Usage:__ Just run the script, no parameters required.
_____________________
+ __geturl__  
It will bring you back OSP console URL and Tackle OR MTA console URL  
__Usage:__ Just run the script, no parameters required.
_____________________
+ __geturl-mtv__  
It will bring you back MTV console URL  
__Usage:__ Just run the script, no parameters required.
_____________________
+ __mount_psi__  
It will mount NFS folder from PSI to bring you all cluster parameters  
__Usage:__ Just run the script, no parameters required.
_____________________
+ __open_cypress_minikube__  
It will start Cypress test manager looking for local minikube deployment as target  
__Usage:__ Just run the script, no parameters required.  
__IMPORTANT:__ Parameters `cypress_git_user` and `cypress_git_password` should contain your token to github, otherwize some tests will fail.
_____________________
+ __open_cypress_mta__  
It will start Cypress test manager looking for MTA cluster as target  
__Usage:__ Run the script with cluster name where MTA is deployed as a parameter.  
__IMPORTANT:__ Parameters `cypress_git_user` and `cypress_git_password` should contain your token to github, otherwize some tests will fail.
_____________________
+ __cluster.conf__  
It will login to the target cluster and define all variables required for Cypress to work, but will not start Cypress itself    
__Usage:__ Run command `source cluster.conf cluster_name` where `cluster_name` is the target cluster you want to use.   
__IMPORTANT:__ Parameters `cypress_git_user`, `cypress_git_password` and some others should be configures properly, otherwize you will need to configure them manually to prevent some test failures.   