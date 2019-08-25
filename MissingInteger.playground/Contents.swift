import UIKit

/*
 This is a demo task.

 Write a function:

 public func solution(_ A : inout [Int]) -> Int

 that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.

 For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.

 Given A = [1, 2, 3], the function should return 4.

 Given A = [−1, −3], the function should return 1.

 Write an efficient algorithm for the following assumptions:

 N is an integer within the range [1..100,000];
 each element of array A is an integer within the range [−1,000,000..1,000,000].

 */
public func solution(_ A : inout [Int]) -> Int {
    var array = Array<Int>(repeating: 0, count: A.count)
    var sum = 0
    A.forEach{ item in
        if item > 0 && item <= array.count {
            array[item - 1] = 1
            sum += 1
        }
    }

    for (index, item) in array.enumerated(){
        if item == 0 {
            return index + 1
        }
    }

    if A.count == sum{
        return A.count + 1
    }
    return 1
}

var A = [1, 3, 6, 4, 1, 2]
print(solution(&A))
