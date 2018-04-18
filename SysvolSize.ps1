$domains = Get-ADForest | select -ExpandProperty domains
$dcs = foreach ($domain in $domains){Get-ADDomainController -Server $domain | select -ExpandProperty Name}

$sysvolsize = foreach ($dc in $dcs){$(Get-ADDomain -Server $dc | select -ExpandProperty Name) + " Sysvol size "+ "{0:N2}" -f $( ((Get-ChildItem \\$dc\sysvol -Recurse | measure -Property Length -Sum).sum)/1mb) + " MB"}
