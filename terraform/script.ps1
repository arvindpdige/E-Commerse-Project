Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Optionally, add a test HTML page
New-Item -Path "C:\inetpub\wwwroot\index.html" -ItemType "File" -Value "<h1>IIS Deployed via Terraform</h1>"