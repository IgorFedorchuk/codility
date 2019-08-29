import UIKit

/*
 A string S consisting of N characters is considered to be properly nested if any of the following conditions is true:

 S is empty;
 S has the form "(U)" or "[U]" or "{U}" where U is a properly nested string;
 S has the form "VW" where V and W are properly nested strings.
 For example, the string "{[()()]}" is properly nested but "([)()]" is not.

 Write a function:

 public func solution(_ S : inout String) -> Int

 that, given a string S consisting of N characters, returns 1 if S is properly nested and 0 otherwise.

 For example, given S = "{[()()]}", the function should return 1 and given S = "([)()]", the function should return 0, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..200,000];
 string S consists only of the following characters: "(", "{", "[", "]", "}" and/or ")".
 */

public func solution(_ S : inout String) -> Int {
    let characters = S.map{String($0)}
    if characters.count == 0{
        return 1
    }

    if characters.count % 2 != 0{
        return 0
    }
    var stack = Array<String>()
    for item in characters{
        if item == "(" || item == "{" || item == "["{
            stack.append(item)
        } else{
            if stack.count > 0{
                let last = stack.last!
                if (item == ")" && "(" == last) ||
                    (item == "}" && "{" == last) ||
                    (item == "]" && "[" == last) {
                    stack.removeLast()
                }else{
                    return 0
                }
            }else{
                return 0
            }
        }
    }


    let result = stack.count == 0 ? 1 : 0
    return result
}

var S = "[]()"

print(solution(&S))
