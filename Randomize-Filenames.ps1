#This only changes names of files in the root of $path
$path = "c:\path\to\files"
$files = Get-ChildItem -Path $path -File
foreach ($file in $files) {
  Rename-Item -Path $file.FullName -NewName ([String]$(Get-Random) + $file.Extension)
}
