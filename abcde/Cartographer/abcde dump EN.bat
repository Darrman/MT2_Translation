@if not exist "Megaten2EN.nes" (
	echo No ROM! Add "Megaten2EN.nes". This is intended to dump the previous patch's text.
	@goto done
)

perl ..\abcde.pl -cm abcde::Cartographer "Megaten2EN.nes" mt2EN_commands.txt dumpEN/mt2_script -m

:done
@pause