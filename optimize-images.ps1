# Set the target folder based on your current structure
$targetDir = "static/images/202604"

Get-ChildItem -Path $targetDir -Filter *.JPG | ForEach-Object {
    $newName = $_.FullName -replace '\.JPG$', '.webp'
    Write-Host "Optimizing: $($_.Name) -> $(Split-Path $newName -Leaf)"
    
    # Convert to WebP with 75% quality (sweet spot for web)
    magick convert $_.FullName -quality 75 $newName
    
    # Optional: Remove the original heavy JPG
    Remove-Item $_.FullName
}