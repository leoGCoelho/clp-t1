#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// Verifica tamanho do texto
int IsValid(char *src, int len, int tokenLen, char *token){
    int i;
    int lines = 1;
    int flagToken = 0;

    for(i=0; i<len; ++i){
        if(src[i] == '\n')
            lines++;
    }

    for(i=0; i<tokenLen; ++i){
        if(!(isalnum(token[i])))
            flagToken = 1;
    }

    if((lines >= 2) && (tokenLen < 20) && (flagToken == 0))
        return 1;
    else
        return 0;
}

// Funcao para obter o texto da 1a linha
char *GetToken(char *src)
{
    int i = 0;
    while (src[i] != '\n')
        i++;
    char *token = (char *)malloc((i + 1) * sizeof(char));

    strncpy(token, src, i);
    token[i] = '\0';

    // printf("\n");
    return token;
}

// Funcao para obter o texto das (n-1) linhas
char *GetText(char *src, int len)
{
    int i = 0;
    while (src[i] != '\n')
        i++;
    char *text = (char *)malloc((len - i) * sizeof(char));

    strncpy(text, src + (i + 1), len - i);

    // printf("\n");
    return text;
}

// Funcao para extrair o texto de um arquivo
char *OpenFile(char filename[])
{
    FILE *fp;
    char c;
    int n = 0;
    char *m = (char *)malloc(sizeof(char));

    if ((fp = fopen(filename, "r")) != NULL)
    {
        while (((c = fgetc(fp)) != EOF))
        {
            m = (char *)realloc(m, (n + 1) * sizeof(char));
            m[n] = c;
            n++;
        }

        fclose(fp);
        //printf("Existem %d letras no arquivo e %d linhas.\n\n", n+1, lines+1);
    }

    return m;
}

// Main
int main(int argc, char *argv[])
{
    char *token, *text, *src;
    int textLen, tokenLen;

    printf("\n\n");

    // Extracao do texto e substrings
    src = OpenFile("teste1.txt");
    token = GetToken(src);
    text = GetText(src, (int)strlen(src));

    textLen = (int)strlen(text);
    tokenLen = (int)strlen(token);

    if(!(IsValid(src, (int)strlen(src), tokenLen, token))){
        printf("Formato de texto inválido!\n");
        return 0;
    }

    // Funcao de link
    int res = findstring(text, &textLen, token, &tokenLen);
    printf("\nO token aparece %d vezes\n\n", res);

    // Liberar memoria
    free(src);
    free(token);
    free(text);

    return 0;
}