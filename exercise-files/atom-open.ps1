
$sourceDir = 'D:\github\python-programming\exercise-files\exercise*\'

$files = Get-ChildItem $sourceDir*.md | % { $_.FullName }
foreach ($file in $files) {

    atom $file

}