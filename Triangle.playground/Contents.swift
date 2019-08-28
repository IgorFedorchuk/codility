import UIKit

/*
 An array A consisting of N integers is given. A triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N and:

 A[P] + A[Q] > A[R],
 A[Q] + A[R] > A[P],
 A[R] + A[P] > A[Q].
 For example, consider array A such that:

 A[0] = 10    A[1] = 2    A[2] = 5
 A[3] = 1     A[4] = 8    A[5] = 20
 Triplet (0, 2, 4) is triangular.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A consisting of N integers, returns 1 if there exists a triangular triplet for this array and returns 0 otherwise.

 For example, given array A such that:

 A[0] = 10    A[1] = 2    A[2] = 5
 A[3] = 1     A[4] = 8    A[5] = 20
 the function should return 1, as explained above. Given array A such that:

 A[0] = 10    A[1] = 50    A[2] = 5
 A[3] = 1
 the function should return 0.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [0..100,000];
 each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
 */

/*
 By sorting the array, we have guaranteed that P+R > Q and Q+R > P (because R is always the biggest). Now what remains, is the proof that P+Q > R, that can be found out by traversing the array. The chance to find such a combination is with three adjacent values as they provide the highest P and Q.


 */
public func solution(_ A : inout [Int]) -> Int {

    let sorted = A.sorted(by:{$0 < $1})
    for (index, item) in sorted.enumerated(){
        if index < sorted.count - 2 && item > 0{
            if item + sorted[index + 1]  > sorted[index + 2]{
                return 1
            }
        }
    }
    return 0
}

var A = [10,2,5,1,8,20]
print(solution(&A))
