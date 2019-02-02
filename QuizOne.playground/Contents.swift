import UIKit

func biggerPairs( input : [Int]) -> Bool {
    var pairs = [Int]()
    var unPairs = [Int]()
    for value in input {
        if(value % 2 == 0){
            pairs.append(value)
        } else {
            unPairs.append(value)
        }
    }
    return pairs.count > unPairs.count
}

biggerPairs(input: [2, 3, 4, 5, 6])

func divisors (input : Int) -> [Int] {
    
    var output = [Int]()
    if(input < 0 ) {
        return output
    }
    
    for value in 0...input {
        if (value % input == 0){
            output.append(value)
        }
    }
    return output
}

divisors(input : 5)

func average(input : [Float]) -> Float {
    var output: Float = 0;
    
    for value in input {
        output += value
    }
    
    return output / Float(input.count)
}

average(input : [1.0, 2.1, 3.5, 4.6])



