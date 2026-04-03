@echo off
set /P rcomp="Enter the target IP address: "
query session /server:%rcomp%
set /P rid="Enter RDP user ID: "
start mstsc /shadow:%rid% /v:%rcomp% /control