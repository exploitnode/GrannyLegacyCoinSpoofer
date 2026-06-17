@echo off
powershell -NoProfile -ExecutionPolicy Bypass -Command ^
 "Write-Host 'Granny Legacy coins spoofer' -ForegroundColor Green;" ^
 "Write-Host 'This will set your coins to a value of 9999. A game restart may be required.' -ForegroundColor Green;" ^
 "$regPath = 'Software\Omega Mega Gigal Intel\Granny: Legacy';" ^
 "$key = [Microsoft.Win32.Registry]::CurrentUser.OpenSubKey($regPath, $true);" ^
 "if (-not $key) {" ^
 "  Write-Host 'FAILED: Registry key not found.' -ForegroundColor Red;" ^
 "  exit 1;" ^
 "};" ^
 "$valueNames = $key.GetValueNames() | Where-Object { $_ -like 'Coins_*' };" ^
 "if ($valueNames.Count -eq 0) {" ^
 "  Write-Host 'FAILED: No Coins_* value found under the key.' -ForegroundColor Red;" ^
 "  $key.Close();" ^
 "  exit 1;" ^
 "};" ^
 "Write-Host ('Found value(s): ' + ($valueNames -join ', ')) -ForegroundColor Green;" ^
 "$bytes = [byte[]](0x00, 0x00, 0x00, 0x00, 0x80, 0x87, 0xC3, 0x40);" ^
 "foreach ($name in $valueNames) {" ^
 "  try {" ^
 "    $key.SetValue($name, $bytes, [Microsoft.Win32.RegistryValueKind]::Binary);" ^
 "    Write-Host ('SUCCESS: Set ''' + $name + ''' to the required value.') -ForegroundColor Green;" ^
 "  } catch {" ^
 "    Write-Host ('FAILED: Could not set ''' + $name + ''' - ' + $_.Exception.Message) -ForegroundColor Red;" ^
 "  }" ^
 "};" ^
 "$key.Close();" ^
 "Write-Host 'Operation completed. Please restart the game for the change to take effect.' -ForegroundColor Green;" ^
 "pause"