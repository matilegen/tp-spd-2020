@ECHO OFF
tasm tsr
tasm main
tasm art
tasm lib
tasm snd
tasm messiAns
tasm jamesAns
tasm ronalAns
tlink /t tsr
tlink main art lib snd messiAns jamesAns ronalAns 
tsr
main
PAUSE