import UIKit

var odds: [Int] = []

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for element in array {
    if element % 2 == 1 {
        odds.append(element)
        continue
    }
    print("even: \(element)")
    
}

print("odds:\(odds)")
