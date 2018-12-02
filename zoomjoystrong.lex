%{

  #include <stdio.h>
  int numLines = 0;
  
%}

%%

END                  { printf("END\n"); }
;                    { printf("END STATEMENT\n"); }
POINT                { printf("POINT\n"); }
LINE                 { printf("LINE\n"); }
CIRCLE               { printf("CIRCLE\n"); }
RECTANGLE            { printf("RECTANGLE\n"); }
SET_COLOR            { printf("SET COLOR\n"); }
[0-9]+               { printf("INT\n"); }
[0-9]+\.[0-9]+       { printf("FLOAT\n"); }
[ | \t]               // ignore
\n                   numLines++;
.                    { printf("ERROR IN LINE %d\n", numLines);}

%%

int main(int argc, char** argv){
  yylex();
}
