@if not exist "Megaten2.nes" (
	echo No ROM! Add "Megaten2.nes".
	@goto done
)

perl ..\abcde.pl -cm abcde::Cartographer "Megaten2.nes" mt2_commands.txt dump/mt2_script -m

:done
@pause