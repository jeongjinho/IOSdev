
#include <stdio.h>

int N; int *arr;
int backlog[3] = {0,};
int getOneNumer(int n);
int main(int argc, const char * argv[]) {
    
    
    
    int result,num = 0 ;
    
    printf("입력\n");
    scanf("%d",&num);
    
    arr = (int *)calloc(num+1,sizeof(int));
    result = getOneNumer(num);
    printf("%d\n",result);
    
    
    
    
    
    return 0;
}

int getOneNumer(int n)
{
    if(n == 1 ){
        
        return 0;
    }
    
    
    
        
      if(n%3 == 0){
        backlog[1] = getOneNumer(n/3) + 1;
        
        
        
    }  if ( n%2 == 0){
        
       backlog[2] = getOneNumer(n/2) + 1;
        
    }
    
    
        
    
    
    
    printf(" 1번째 %d 2번째 %d 3번째%d ",backlog[0],backlog[1],backlog[2]);
    
    return backlog[0];
}
