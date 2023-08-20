FOR /F %%G IN ('net localgroup administrators ^| findstr /vc:"The command completed successfully." ^| ^
findstr /vc:^%%USERNAME^%% ^| ^
findstr /vc:"Alias name     administrators" ^| ^
findstr /vc:"Comment        Administrators have complete and unrestricted access to the computer/domain" ^| ^
findstr /vc:"Members" ^| ^
findstr /vc:"-------------------------------------------------------------------------------"') ^
DO net localgroup administrators /delete %%G
:more_input
	set "input="
	set /p input= Type an administrator:
	IF DEFINED input (
		net localgroup administrators /add %input%
		goto :more_input
	)