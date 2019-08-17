import UIKit

func binarySearch<T>(items: [T], search: T) -> Int? where T: Comparable{
    var low = 0
    var hight = items.count - 1
    guard let first = items.first, first <= search, let last = items.last, last >= search else {
        return nil
    }

    while low <= hight {
        let midIndex: Int = (hight + low) / 2
        let midValue = items[midIndex]
        if midValue == search {
            return midIndex
        }

        if midValue > search{
            hight = midIndex - 1
        }else{
            low = midIndex + 1
        }
    }

    return nil
}

let array = [1, 3, 10, 15]

let guess = binarySearch(items: array, search: 10)
print(guess ?? "None")
