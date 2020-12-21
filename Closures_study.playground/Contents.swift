import Foundation

//Closures / Lamda

// Closure is the function that can be passed around
// Function be a type

let myFunction: ((Int) -> (Bool)) = { number in
    if number > 3 {
        return true
    }
    return false
}

let res = myFunction(2)


func isGreaterThanThree(number: Int) -> Bool {
    if number > 3{
        return true
    }
    return false
}
let res2 = isGreaterThanThree(number: 4)
