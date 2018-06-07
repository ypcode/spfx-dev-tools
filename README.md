# SPFx Localized resources maintenance

This little tool allows to easily maintain localized resources in SPFx solutions

## Prerequisites

This tool uses some PowerShell utilities for Excel
You need to install it using Import-Module
'''
    Install-Module ImportExcel
'''

## Usage

Maintain all the keys and values of your localized resources in an Excel file
Each sheet represents a locale and should be named with the locale identifier (e.g. en-us, fr-fr, fr-be, ...)

Execute the tool
```
    .\Update-SPFxLocalizedResources.ps1 -Path resources.xlsx -Module MyModule
```

Or simply
```
    .\Update-SPFxLocalizedResources.ps1
```

default values are
Path: localized-resources.xlsx
Module: WebPartStrings

## Output
-a JS file will be generated for all locales
-A TypeScript typings file (.d.ts) will be generated with the keys

