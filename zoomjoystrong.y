%{

#include <stdio.h>
#include "zoomjoystrong.h"
int yyerror(const char *e);

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
%token <val> DIGIT
%token (fVal> FLOAT

%%

program: 
