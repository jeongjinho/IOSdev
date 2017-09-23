
import Foundation

func myMax <T : Comparable> (a: T, b: T) -> T {
    if a < b {
        return b
    }
    return a
}

let cycle = readLine()!.components(separatedBy:  " " ).map({Int($0)!})

var dp:[Int] = Array(repeating:0, count:301)
var array:[Int] = Array(repeating:0, count:cycle[0] + 1)

for i in 0..<cycle[0]{
   
    array[i] = readLine()!.components(separatedBy:  " " ).map({Int($0)!})[0]
   
}

dp[0] = array[0]
dp[1] = myMax(a: array[0], b: 0) + array[1]
dp[2] = myMax(a:array[1], b: array[0]) + array[2]
print(array)




    for i in 3..<array.count{
        
        dp[i] = myMax(a: array[i] + array[i-1] + dp[i-3], b: array[i] + dp[i-2])
        



}

print(dp[cycle[0] - 1])
