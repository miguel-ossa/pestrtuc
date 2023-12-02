NAME=PEstruc
$(NAME).com: $(NAME).exe
        exe2bin $(NAME).exe $(NAME).com
$(NAME).exe: $(NAME).obj
        \masm611\binr\Link $(NAME).obj,,,,;
$(NAME).obj: $(NAME).asm ..\inc\mac\estruc.mac ..\inc\mac\macros.mac
        \masm611\bin\masm /la /I\masm611\include $(NAME).asm
