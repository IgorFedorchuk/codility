import UIKit

var str = "Hello, playground"

/*
 A non-empty array A consisting of N integers is given.

 The leader of this array is the value that occurs in more than half of the elements of A.

 An equi leader is an index S such that 0 ≤ S < N − 1 and two sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N − 1] have leaders of the same value.

 For example, given array A such that:

 A[0] = 4
 A[1] = 3
 A[2] = 4
 A[3] = 4
 A[4] = 4
 A[5] = 2
 we can find two equi leaders:

 0, because sequences: (4) and (3, 4, 4, 4, 2) have the same leader, whose value is 4.
 2, because sequences: (4, 3, 4) and (4, 4, 2) have the same leader, whose value is 4.
 The goal is to count the number of equi leaders.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given a non-empty array A consisting of N integers, returns the number of equi leaders.

 For example, given:

 A[0] = 4
 A[1] = 3
 A[2] = 4
 A[3] = 4
 A[4] = 4
 A[5] = 2
 the function should return 2, as explained above.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−1,000,000,000..1,000,000,000].
 */
public func solution(_ A : inout [Int]) -> Int {
    let a = A
    var stack = Array<Int>()
    for (_, item) in a.enumerated(){
        if let last = stack.last {
            if last == item{
                stack.append(item)
            }else{
                stack.removeLast()
            }
        }else{
            stack.append(item)
        }
    }

    if let last = stack.last{
        var candidateOccurance = 0
        var dict = [Int: Int]()
        for (index, item) in a.enumerated(){
            if item == last{
                candidateOccurance += 1
                dict[index] = candidateOccurance
            }
        }

        if candidateOccurance > a.count / 2{
            var result = 0
            var lastOccurance = 0
            for (index, _) in a.enumerated(){
                if let occurance = dict[index]{
                    lastOccurance = occurance
                }

                if lastOccurance > (index + 1) / 2 && (candidateOccurance - lastOccurance) > (a.count - (index + 1)) / 2{
                    result += 1
                }
            }

            //print("result")
            //print(result)
            return result
        }
    }

    //print("no candidate")
    //print(0)
    return 0
}
