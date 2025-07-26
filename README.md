# LocalAdminCompliancy

With these files you can create a custom compliance policy in Intune, to detect any rogue admin accounts. More information in this blogpost. 

## detect.ps1

Use the `detect.ps1`script content as a basis for a custom compliance poliy in Intune. Modify parameters as desired, the script will return the amount af additional admin accounts on the endpoint.

## admins.json

The `admins.json` holds the definition for the actual compliance policy, defining when a device is or is not compliant.