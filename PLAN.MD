# ART PLAN
## The Archivist's Renaming Tool

### Functions

- To be able to rename digital objects, preserving their original title and file extension if necessary.
- Function as a permanent tool, without needing to be reopened on a per-action basis. This will mean implementing a menu system.

### Structure

```
 ________   
/        |
|        V
|    Opening menu
|        |
|        V
|    Input required action parameters
|        |
|        V
|    GOTO action and execute in Powershell
|        |
|        V
|    GOTO exit menu
|        |
|        V
L    Exit menu
```

### Code Snippets

``` Powershell
$nr=1; Get-ChildItem * -File | %{Rename-Item $_ -NewName (('A.CBH.1.{0} (' + $_.BaseName + ')' + $_.Extension) -f $nr++)}
```
``` Powershell
$nr=1; Get-ChildItem * -Directory | %{Rename-Item $_ -NewName (('A.BGT.{0} (' + $_.BaseName + ').DEL') -f $nr++)}
```
``` Powershell
Get-ChildItem * -Directory | %{Rename-Item $_ -NewName ($_.BaseName + '.DEL')}
```