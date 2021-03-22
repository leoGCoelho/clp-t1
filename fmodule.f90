integer function FINDSTRING(text, textlen, token, tokenlen)
    !Declaracao de variaveis
    integer :: cont
    integer :: textlen
    integer :: tokenlen
    character (LEN=textlen) :: text
    character (LEN=tokenlen) :: token
    integer :: i
    integer :: j
    integer :: flag

    !Funcoes
    print*, tokenlen
    write (*,*) token
    print*, textlen
    write (*,*) text
    flag=1;
    i=0;
    cont=0;
    DO WHILE (i<textlen)
        IF (text(i:i) /= " ") THEN
            IF(text(i:i+tokenlen-1)/=token) THEN
                flag=0;
            END IF
            IF (flag==1 .AND. IACHAR(text(i+tokenlen:i+tokenlen))>64 .AND. IACHAR(text(i+tokenlen:i+tokenlen))<91) THEN
                flag=0;
            END IF
            IF (flag==1 .AND. IACHAR(text(i+tokenlen:i+tokenlen))>96 .AND. IACHAR(text(i+tokenlen:i+tokenlen))<123) THEN
                flag=0;
            END IF
            IF (flag==1) THEN
                cont=cont+1;
                i=i+tokenlen;
            ELSE
                i=i+1;
            END IF
            flag=1;
        ELSE
            i=i+1;
        END IF
       END DO

    !Saida
    FINDSTRING = cont;
    return
end function FINDSTRING
