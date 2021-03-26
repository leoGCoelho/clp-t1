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
    integer :: flag2

    !Funcoes
    !print*, tokenlen
    write (*,*) token
    !print*, textlen
    write (*,*) text
    flag=1;
    flag2=1;
    i=0;
    j=0;
    cont=0;
    DO WHILE (i<textlen)
        IF (text(i:i) /= " ") THEN
            IF(text(i:i+tokenlen-1)/=token) THEN
                flag=0;
            END IF
            IF (flag==1 .AND. i>0 .AND. text(i-1:i-1) /= " " .AND. text(i-1:i-1) /= "\n" .AND. text(i-1:i-1) /= "(") THEN
                flag=0;
            END IF
            DO WHILE (flag==1 .AND. i+tokenlen+j<textlen .AND. flag2==1)
                    IF (text(i+tokenlen+j:i+tokenlen+j) == " " .OR. text(i+tokenlen+j:i+tokenlen+j) == "\n") THEN
                        flag2=0;
                    ELSE
                        IF (flag==1 .AND. text(i+tokenlen+j:i+tokenlen+j) /= "!" .AND. text(i+tokenlen+j:i+tokenlen+j)/="?" &
                        .AND. text(i+tokenlen+j:i+tokenlen+j)/=")" .AND. text(i+tokenlen+j:i+tokenlen+j)/="," &
                        .AND. text(i+tokenlen+j:i+tokenlen+j)/="." .AND. text(i+tokenlen+j:i+tokenlen+j)/=":" &
                        .AND. text(i+tokenlen+j:i+tokenlen+j)/=";") THEN
                            flag=0;
                        END IF
                    END IF
                    j=j+1;
            END DO
            j=0;
            flag2=1;
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
