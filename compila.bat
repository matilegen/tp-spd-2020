@ECHO OFF
tasm tsr
tlink /t tsr
tsr
tasm main
tasm lib
tasm art
tasm jamesans
tasm ans
tlink main art lib jamesans ans
main
PAUSE