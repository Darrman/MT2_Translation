# Digital Devil Story: Megami Tensei 2 English Fan Translation
This repository is intended to host a fan-translated patch for Megami Tensei 2
into English and the source files required to assemble the patch.

## For players
Download Lunar IPS https://www.romhacking.net/utilities/240/ and apply the
included IPS patch to a Japanese rom of the game. ROM CRC32 should equal 96773F32.

The patch translates the majority of the menus in the game. All demon, item,
and spell names are translated. Most miscellaneous text has also been
translated. Menu commands are all in English, and the game is largely
in a playable state.

The main plot and NPC text is not translated as of yet. Demon 
conversations are also not currently translated. Combat interactions
are translated, but poorly. I do not know any Japanese, so I had to
resort to Google in some instances. 

## For translators
Download Atlas https://www.romhacking.net/utilities/224/ , the script insertion
utility, if the game itself is to be modified.

Download Cartographer https://www.romhacking.net/utilities/647/ , the script
dumping utility, if you want to access the script.

At present the dumps are quite rough looking. Be sure to place the tools'
executables in their respective folders, and name any roms used to be
in line with the Atlas batch file or Cartographer command file.
If you need help using either tool, consult their respective readmes.

## Changelog
*0.1* - 23/02/19: Initial release.

## Credits
Darrman - Hacking

DDSTranslation - Translator of Kyuuyaku Megami Tensei, the SNES port of this.
His work and sources were used as a point of reference for terminology here.
Dialogue font was taken from the SMT1 translation.

## Known Issues
Equipment items in the status screen use the wrong palette for some reason.

Some combat choices and pop-up windows break out of their windows. Due to
sprite limitations, these windows could only be so big, and I decided to
write the last character of text over the border so they'd "fit".

The bottom pixel on the fourth command on battle menus flickers.