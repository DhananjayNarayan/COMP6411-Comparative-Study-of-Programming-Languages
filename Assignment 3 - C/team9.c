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
element aasel(atom a)
{
element ele ;
ele.type=ATOM;
ele.a=a;
return ele;
}

//Q2
element lasel(list l)
{
element ele= {.type=LIST, .l=l }; 
return ele;
}

//Q3
list cons(element e, list l)
{
list newList= (list) malloc(sizeof(struct _listnode));
newList->el= e;
newList->next= l;
return newList;
}

//Q4
list append(list l1, list l2)
{
}

//Q5
element car(element e)
{
   if (e.type != LIST) {
        return NIL;
    }
    else{
    return e.l->el;
    }
}

//Q6
list cdr(element e)
{
  return e.l->next;
}
