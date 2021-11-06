$result = [System.Text.Encoding]::UTF8.GetString((Invoke-WebRequest -Uri $package.repo_uri).RawContentStream.ToArray()) | ConvertFrom-Yaml
if ($result.version -gt $package.last_checked_tag)
{
    $update_found = $true
    $version = $result.version
    $jsonTag = $result.version
    $urls.Add("https://cos5.cloud.tencent.com/cosbrowser/$($result.path)") | Out-Null
}
else
{
    $update_found = $false
}
