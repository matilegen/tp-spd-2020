@ECHO OFF
tasm tsr
tasm main
tasm art
tasm lib
tasm messiAns
tasm jamesAns
tlink /t tsr
tlink main art lib messiAns jamesAns
tsr
main
PAUSE