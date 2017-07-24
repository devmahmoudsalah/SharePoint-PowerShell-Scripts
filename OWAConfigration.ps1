############# Step one Added Need Feature prerequisite #################
Import-Module ServerManager
Add-WindowsFeature Web-Server,Web-Mgmt-Tools,Web-Mgmt-Console,Web-WebServer,Web-Common-Http,Web-Default-Doc,Web-Static-Content,Web-Performance,Web-Stat-Compression,Web-Dyn-Compression,Web-Security,Web-Filtering,Web-Windows-Auth,Web-App-Dev,Web-Net-Ext45,Web-Asp-Net45,Web-ISAPI-Ext,Web-ISAPI-Filter,Web-Includes,InkandHandwritingServices


########### Step configure Web Apps Server Farm With Administrator##########################
New-OfficeWebAppsFarm --InternalURL [OWAServerName http://deveserver.atheb.com ] -AllowHttp [-EditingEnabled allow only with lisence]


########### Step 1,  configure sharepoint  Server Farm With Administrator##########################
New-SPWOPIBinding -ServerName [OWAServerName http://deveserver.atheb.com] -AllowHTTP [Web Application Open Plateform Interface]


########### Step 2 Get Zone  configure sharepoint , Server Farm With Administrator##########################
Get-SPWOPIZone


########### Step 3 Change the Zone to use http,  configure sharepoint  Server Farm With Administrator##########################
 
Set-SPWOPIZone --zone internal-http

Get-SPWOPIZone

########### Step 4  Check the Zone again,  configure sharepoint  Server Farm With Administrator##########################


Get-SPWOPIZone

########### Step 5   Change the AllowOAuthOverHttp,  configure sharepoint  Server Farm With Administrator##########################

(Get-SPSecurityTokenServiceConfig).AllowOAuthOverHttp


########### Step 6   If this command returns False, run the following commands to set this to True,  configure sharepoint  Server Farm With Administrator##########################

$config = (Get-SPSecurityTokenServiceConfig)
$config.AllowOAuthOverHttp = $true
$config.Update()
########### Step 7  Run the following command again to verify that the AllowOAuthOverHttp setting is now set to True.,  configure sharepoint  Server Farm With Administrator##########################

(Get-SPSecurityTokenServiceConfig).AllowOAuthOverHttp