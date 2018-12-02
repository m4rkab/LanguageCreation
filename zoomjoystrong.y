%{

#include <stdio.h>
#include "zoomjoystrong.h"
int yyerror(const char *err);

%}

%union {
  int val;
  float fVal;
}

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token <val> INT
%token <fVal> FLOAT

%%

program: list_of_expr END
     ;

list_of_expr: expr
     | list_of_expr expr
     ;
     
expr: POINT INT INT END_STATEMENT {point($2, $3);}
     | LINE INT INT INT INT END_STATEMENT {line($2, $3, $4, $5);}
     | CIRCLE INT INT INT END_STATEMENT {circle($2, $3, $4);}
     | RECTANGLE INT INT INT INT END_STATEMENT {rectangle($2, $3, $4, $5);}
     | SET_COLOR INT INT INT END_STATEMENT {set_color($2, $3, $4);}
     ;
     
%%

int main (int argc, char** argv) {
     setup();
     yyparse();
     finish();
}

int yyerror(const char* err) {
     printf("%s\n", err);
}
     
