import UIKit

public func solution(_ N : Int) -> Int {
    let characterArray = [String(N, radix: 2)].flatMap { $0 }
    let stringArray = characterArray.map { String($0) }
    print(stringArray)
    var maxGap = 0
    var currentGap = 0

    for (index, string) in stringArray.enumerated() {
        if string == "0" {
            if index == stringArray.count - 1 {
                currentGap = 0
            }else{
                currentGap += 1
            }
        }else{
            maxGap = max(currentGap, maxGap)
            currentGap = 0
        }
    }

    return maxGap
}

print(solution(1))
