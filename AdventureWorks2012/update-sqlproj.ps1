# Define the project file
$projectFile = ".\AdventureWorks2012.sqlproj"

# Load .sqlproj file content
[xml]$projXml = Get-Content $projectFile

# Get current <Build Include=...> entries
$existingIncludes = $projXml.Project.ItemGroup.Build |
    Where-Object { $_.Include } |
    ForEach-Object { $_.Include.Replace('/', '\') }

# Find all .sql files recursively
$sqlFiles = Get-ChildItem -Path . -Recurse -Filter *.sql | ForEach-Object {
    $_.FullName.Substring((Get-Location).Path.Length + 1).Replace('/', '\')
}

# Get the list of .sql files not yet included in the .sqlproj
$newIncludes = $sqlFiles | Where-Object { $_ -notin $existingIncludes }

# Exit if no new files to add
if ($newIncludes.Count -eq 0) {
    Write-Host "✅ No new .sql files to add. Your .sqlproj is up to date."
    return
}

# Create new <ItemGroup> with missing files
$itemGroup = $projXml.CreateElement("ItemGroup")
foreach ($file in $newIncludes) {
    $buildNode = $projXml.CreateElement("Build")
    $buildNode.SetAttribute("Include", $file)
    $itemGroup.AppendChild($buildNode) | Out-Null
}

# Append the new ItemGroup at the end of the project
$projXml.Project.AppendChild($itemGroup) | Out-Null

# Backup old .sqlproj
Copy-Item $projectFile "$projectFile.bak"

# Save updated .sqlproj
$projXml.Save($projectFile)

Write-Host "Updated '$projectFile' with $($newIncludes.Count) new .sql file(s)."
Write-Host "Backup saved as '$projectFile.bak'"