#include<stdio.h>
#include<stdlib.h>
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
   if(l1 == NULL ){
        return l2;
    }
    else if (l2 == NULL){
        return l1;
    }
   else{
   list mergedlist = l1;
   struct _listnode * ptr = mergedlist;
   while(ptr->next != NULL){
        ptr = ptr->next;
    }
    ptr->next = l2;
    return mergedlist;
   }
}

//Q5
element car(element e)
{
   if (e.type!=LIST) {
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

//Q7
list cddr(element e){
  return (e.l->next)->next;
}

//Q8
void print(element e){
    if(e.type == ATOM){
        printf(" %c ", e.a);
    }
    else if(e.type == LIST){
        if (e.l == NULL){
            printf("NIL");
        }
        else{
            printf("(");
            print(e.l->el);
            print(lasel(e.l->next));
            printf(")");
        }

    }
}

// Q9
void lfree(list lst){
  list templist = lst, pNext;

    while (NULL != templist)
    {
        pNext = templist->next;
        free(templist);
        templist = pNext;
    }
  
  
}
int main()
{
    element a = aasel('a');
    element b = aasel('b');
    element c = aasel('c');
    element d = aasel('d');
    element e = aasel('e');
    list pList = cons(a, cons(lasel(cons(b, cons(c, NULL))), cons(d, cons(e,NULL))));
    print(lasel(pList));    // list as element
    printf("\n");
    // lfree(pList);
    print(car(lasel(pList)));      // car
    printf("\n");
    print(lasel(cdr(lasel(pList))));    // cdr
    printf("\n");
    print(car(car(lasel(pList))));    // car(car(list))
    // printf("\n");
    // print(lasel(cddr(lasel(pList))));   // cddr
    lfree(pList);
    return 0;
}
