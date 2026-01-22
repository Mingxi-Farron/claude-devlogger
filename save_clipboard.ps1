param(
    [string]$OutputPath
)

Add-Type -AssemblyName System.Windows.Forms
$img = [System.Windows.Forms.Clipboard]::GetImage()

if ($img) {
    $img.Save($OutputPath, [System.Drawing.Imaging.ImageFormat]::Png)
    Write-Output "Image saved to: $OutputPath"
} else {
    Write-Output "No image in clipboard"
    exit 1
}
