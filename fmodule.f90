integer function FINDSTRING(text, textlen, token, tokenlen)
    !Declaracao de variaveis
    integer :: cont
    integer :: textlen
    integer :: tokenlen
    character (LEN=textlen) :: text
    character (LEN=tokenlen) :: token

    !Funcoes
    cont=13;
    print*, tokenlen
    write (*,*) token
    print*, textlen
    write (*,*) text

    !Saida
    FINDSTRING = cont;
    return
end function FINDSTRING