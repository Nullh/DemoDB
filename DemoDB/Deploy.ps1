# load Dac Pac
add-type -path "C:\Program Files (x86)\Microsoft SQL Server\110\DAC\bin\Microsoft.SqlServer.Dac.dll"

# make DacServices object, needs a connection string 
$d = new-object Microsoft.SqlServer.Dac.DacServices "server=(local)"

# Load dacpac from file & deploy to database named pubsnew 
$dp = [Microsoft.SqlServer.Dac.DacPackage]::Load($DacPacFile) 
$d.Deploy($dp, $DatabaseName, $true)