param (
    $Path="localized-resources.xlsx",
    $Module="WebPartStrings"
)

$interface = "I$Module"

$sheets = Get-ExcelSheetInfo -Path $Path

$allKeys = @{}
ForEach ($sheet in $sheets) {
    $resources = Import-Excel -Path $Path -WorksheetName $sheet.Name

    Write-Host "Updating localized resources for locale $($sheet.Name)"
    $jObject = New-Object -TypeName psobject

    ForEach ($resource in $resources) {
        # Add to all keys
        $allKeys[$resource.Key] = $true

        # Add to the object for the current locale
        $jObject | Add-Member $resource.Key $resource.Value
    }

    $json = $jObject | ConvertTo-Json

    $content = "define([], function() {
return $json;
});"    

    $content | Out-File "$($sheet.Name).js"
}

$moduleTypings = "declare interface $interface {"
ForEach ($key in $allKeys.Keys) {
    $moduleTypings += "
    $($key): string;"
}
$moduleTypings += "
}

declare module '$Module' {
    const strings: $interface;
    export = strings;
}"

$moduleTypings | Out-File "$($Module).d.ts"