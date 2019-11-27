if ($IsLinux){
        Write-Host "Linux OS"
        }
if ($IsWindows){
        Write-Host "Windows OS"
}
dotnet build
$info = Start-Process dotnet -ArgumentList (Resolve-Path "bin\Debug\netcoreapp3.0\HelloWorld.dll") -NoNewWindow -PassThru
Write-host "Setting PID to $($info.Id)"
Write-Host "##vso[task.setvariable variable=pid;]$($info.Id)"
Write-Host "Running application should exist under the PID of $($info.Id)"

try {
  Stop-Process -Id $info.Id -ErrorAction stop
  Write-Host "Killed process with ID: $($info.Id)"
} catch {
  Write-Host "Failed to kill process"
  exit 1
}
