#include <stdio.h>
#include <stdlib.h>

char* OpenFile(/*char *filename*/int flag){
    FILE *fp;
    char c;
    int n=0, lines=0;
    char *m = (char*) malloc(sizeof(char));

    if ((fp=fopen ("teste1.txt","r")) != NULL) {
        if (flag == 0){
            while( ((c=fgetc(fp)) !=EOF) && (lines == 0)) {
                if (c == '\n')
                    lines++;
                    
                m = (char*) realloc(m, (n+1) *sizeof(char));
                m[n] = c;
                n++;
            }
        }
        else{
            while( ((c=fgetc(fp)) !=EOF) ) {
                if (c == '\n')
                    lines++;
                else{
                    if (lines > 0){
                        m = (char*) realloc(m, (n+1) *sizeof(char));
                        m[n] = c;
                        n++;
                    }
                }
            }
        }

        fclose(fp);
        //printf("Existem %d letras no arquivo e %d linhas.\n\n", n+1, lines+1);
    }

    return m;
}

int main() {
    char *token;
    char *text;

    token = OpenFile(0);
    text = OpenFile(1);
    printf("%s", token);

    free(text);
    return 0;
}