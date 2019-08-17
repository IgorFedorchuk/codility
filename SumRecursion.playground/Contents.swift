import UIKit

func sum(array: [Int]) -> Int {
    if array.count == 1 {
        return array[0]
    }

    return array[0] + sum(array: Array(array[1...array.count - 1]))
}

let result = sum(array: [1,2,3,4])
print(result)

