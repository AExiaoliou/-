echo "Woring Path: $PWD"
$gradlew_properties = Get-ChildItem -Path $PWD -Recurse -Force |? Name -eq "gradle-wrapper.properties"

echo "gradle warpper found? `n$gradlew_properties"
if ($gradlew_properties -eq $null) {
    echo "gradlew_properties is null (cannot found)" "program exit"
    exit
}

$proxy_settings = 
"systemProp.https.proxyHost=host
systemProp.https.proxyPort=port
systemProp.http.proxyHost=host
systemProp.http.proxyPort=port"

echo $proxy_settings | Out-File -FilePath $gradlew_properties -Append
Get-Content $gradlew_properties -Tail 4