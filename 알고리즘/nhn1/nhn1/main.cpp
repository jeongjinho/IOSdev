#include <iostream>
#include <memory.h>
#include <queue>
#include <algorithm>
using namespace std;

int rec[101][101];
queue<int> xque;
queue<int> yque;
vector<int> secondsum;
int dx[] = {0,0,-1,1};
int dy[] = {-1,1,0,0};

int cnt;
int width = 0;

void bfs(int x, int y){
    int sum = 0;
    rec[x][y] = -1;
    xque.push(x);
    yque.push(y);
    
    
    while (xque.size()>0) {
        int x = xque.front();
        int y = yque.front();
        xque.pop(); yque.pop();
        
        sum++;
        
        for(int i=0; i<4; i++){
            int nextX = x+dx[i];
            int nextY = y+dy[i];
            
            if(nextX >=0 && nextX <cnt && nextY >=0 && nextY < cnt && rec[nextX][nextY]== 1){
                rec[nextX][nextY] = -1;
                xque.push(nextX);
                yque.push(nextY);
            }
        }
    }
    
    secondsum.push_back(sum);
    width++;
    
}

int main(){
    cin >> cnt;
    
    for(int i =0; i < cnt; i++){
        for(int j =0; j < cnt; j++){
            scanf("%d", &rec[i][j]);
        }
    }
    
    for(int i=0; i<cnt; i++)
    {
        for(int j=0; j<cnt; j++)
        {
            if(rec[i][j] == 1)
                bfs(i,j);
        }
    }
    
    cout<<width<<endl;
    sort(secondsum.begin(),secondsum.end());
    for(int i=0; i<secondsum.size(); i++)
    {
        printf("%d\n",secondsum[i]);
    }
    
    return 0;
}
