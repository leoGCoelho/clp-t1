integer function FINDSTRING(str, len)
    !Declaracao de variaveis
    integer :: cont
    !integer :: len
    character (*) :: str

    !Funcoes
    cont=13;
    !print*, len
    write (*,*) str

    !Saida
    FINDSTRING = cont;
    return
end function FINDSTRING