/*
 A positive integer D is a factor of a positive integer N if there exists an integer M such that N = D * M.

 For example, 6 is a factor of 24, because M = 4 satisfies the above condition (24 = 6 * 4).

 Write a function:

 public func solution(_ N : Int) -> Int

 that, given a positive integer N, returns the number of its factors.

 For example, given N = 24, the function should return 8, because 24 has 8 factors, namely 1, 2, 3, 4, 6, 8, 12, 24. There are no other factors of 24.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..2,147,483,647].
 */

import UIKit

public func solution(_ N : Int) -> Int {
    if N == 1{
        return 1
    }

    var i = 1
    var result = 0
    while i * i < N{
        if N % i == 0{
            result += 2
        }
        i += 1
        if i * i == N{
            result += 1
        }
    }
    return result
}

print(solution(24))

