param([string]$Label='baseline', [int]$Seconds=30, [int]$Samples=3)
New-Item -ItemType Directory -Force .ao | Out-Null
$rows=@()
1..$Samples | ForEach-Object {
 $before=@{}; Get-Process AllOutClient,AllOutServer | ForEach-Object {$before[$_.Id]=$_.CPU}
 $watch=[Diagnostics.Stopwatch]::StartNew(); Start-Sleep -Seconds $Seconds; $elapsed=$watch.Elapsed.TotalSeconds
 Get-Process AllOutClient,AllOutServer | ForEach-Object {if($before.ContainsKey($_.Id)) {$rows += [pscustomobject]@{label=$Label;sample=1;process=$_.ProcessName;pid=$_.Id;cpu_ms_per_second=[math]::Round(1000*($_.CPU-$before[$_.Id])/$elapsed,3);working_set_mb=[math]::Round($_.WorkingSet64/1MB,2)}}}
}
$rows | ConvertTo-Json | Set-Content ".ao/$Label-cpu.json"
$rows | Group-Object process | ForEach-Object {[pscustomobject]@{process=$_.Name;mean_cpu_ms_per_second=($_.Group | Measure-Object cpu_ms_per_second -Average).Average}}




