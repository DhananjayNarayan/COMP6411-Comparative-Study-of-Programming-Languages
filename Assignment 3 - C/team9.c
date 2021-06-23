#include<stdio.h>
typedef enum { ATOM, LIST } eltype;
typedef char atom;
struct _listnode;
typedef struct {
eltype type;
union {
atom a;
struct _listnode* l;
};
} element;
typedef struct _listnode {
element el;
struct _listnode* next;
} * list;
const element NIL = { .type=LIST, .l=NULL };

//Q1
element aasel(atom a){
element ele = {.type=ATOM, .a=a } ;
 return ele
}
