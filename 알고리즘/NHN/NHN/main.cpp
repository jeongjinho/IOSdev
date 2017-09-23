

#include <sstream>
#include <iostream>
#include <string>
#include <vector>
#include <deque>
using namespace std;
int main(int argc, const char * argv[]) {
    string cycle;
    
   
        bool isExit ;
    
        deque<int> deque(0);
        vector<int> v;
        getline (cin,cycle);
        istringstream iss(cycle);
    
        do
        {
            string subs;
            printf("%s",subs.c_str());
            int num;
            iss >> subs;
            num = atoi(subs.c_str());
            
            if(num != 0){
            
                isExit = false;
                for (int i = 0; i< deque.size(); i++) {
                    
                    if(deque[i] == num ){
                        isExit = true;
                    }
                }
                
                
                
                if (isExit == true && deque.size() >= 3) {
                    
                  
                    deque.pop_front();
                    deque.push_back(num);
                } else if(isExit == false && deque.size() < 3 ){
                    
                    deque.push_back(num);
                    
                } else if(isExit == false && deque.size() >= 3){
                    
                    v.push_back(deque.front());
                    deque.pop_front();
                    deque.push_back(num);
                    
                }

            
            }
            
            
        } while (iss);
    
    
    
    for (int i = 0; i < v.size(); i++) {
        
        printf("%d",v[i]);
    }
   
   
   
    return 0;
}
