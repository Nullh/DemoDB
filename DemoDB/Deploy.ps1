# Set params
if (! $dbName)
{
    Write-Host "Missing required variable dbName" -ForegroundColor Yellow
    exit 1
}
if (! $dbUser)
{
    Write-Host "Missing required variable dbUser" -ForegroundColor Yellow
    exit 1
}
if (! $dbPassword)
{
    Write-Host "Missing required variable dbPassword" -ForegroundColor Yellow
    exit 1
}
 
# Add the DLL
# For 64-bit machines
Add-Type -path "C:\Program Files\Microsoft SQL Server\130\DAC\bin\Microsoft.SqlServer.Dac.dll"
 
# Create the connection string
$d = New-Object Microsoft.SqlServer.Dac.DacServices ("data source=(local);User Id = " + $dbUser + ";pwd=" + $dbPassword)
 
#Load the dacpac
$dacpac = (Get-Location).Path + "\Content\Movies.dacpac"
#$dacpacoptions = (Get-Location).Path + "\Content\" +  $dbPublishProfile + ".publish.xml"
 
Write-Host $dacpac
Write-Host $dacpacoptions

# Set the DacDeployOptions
$options = New-Object Microsoft.SqlServer.Dac.DacDeployOptions -Property @{
 'BlockOnPossibleDataLoss' = $true;
 'DropObjectsNotInSource' = $true;
 'ScriptDatabaseOptions' = $true;
 'IgnorePermissions' = $true;
 'IgnoreRoleMembership' = $true
}
 
#Load dacpac from file & deploy to database
$dp = [Microsoft.SqlServer.Dac.DacPackage]::Load($dacpac)
 
#Read a publish profile XML to get the deployment options
#$dacProfile = [Microsoft.SqlServer.Dac.DacProfile]::Load($dacpacoptions)
 
# Deploy the dacpac
$d.Deploy($dp, $dbName, $true, $options)