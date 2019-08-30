import UIKit

/*
 A string S consisting of N characters is called properly nested if:

 S is empty;
 S has the form "(U)" where U is a properly nested string;
 S has the form "VW" where V and W are properly nested strings.
 For example, string "(()(())())" is properly nested but string "())" isn't.

 Write a function:

 public func solution(_ S : inout String) -> Int

 that, given a string S consisting of N characters, returns 1 if string S is properly nested and 0 otherwise.

 For example, given S = "(()(())())", the function should return 1 and given S = "())", the function should return 0, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..1,000,000];
 string S consists only of the characters "(" and/or ")".
 */

public func solution(_ S : inout String) -> Int {
    let str = S//"(()(())())"
    // "(()(())())"
    let stringArray = str.map({String($0)})
    var stack = Array<String>()

    for (_, item) in stringArray.enumerated(){
        if item == "("{
            stack.append("(")
        } else{
            if stack.last != nil {
                stack.removeLast()
            } else{
                return 0
            }
        }
    }

    let result = stack.count == 0 ? 1 : 0
    return result
}

var S = "(()(())())"
print(solution(&S))
