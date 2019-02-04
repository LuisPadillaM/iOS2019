import UIKit

class Dog {
    
    var name : String
    var color : String
    var age   : Int
    
    init(name: String, color: String, age : Int) {
        self.name = name
        self.color = color
        self.age = age
    }
    
    func toString() -> String {
        return """
        Nombre: \(self.name)
        Color: \(self.color)
        Edad: \(self.age) años
        """
    }
}


class Person {
    
    var name : String
    var identifier : String
    var age   : Int
    var dogs : [Dog]
    
    init(name: String, identifier: String, age : Int, dogs : [Dog]) {
        self.name = name
        self.identifier = identifier
        self.age = age
        self.dogs = dogs
    }
    
    func toString() -> String {
        return """
        Nombre: \(self.name)
        Identificador: \(self.identifier)
        Edad: \(self.age) años
        Cantidad de perros:  \(self.dogs.count)
        """
    }
}





func PeopleInitializer () -> Void {
    
    let person1 = Person(name : "Luis", identifier : "402160699", age : 26, dogs : [])
    let person2 = Person(name : "Joss", identifier : "?????????", age : 00, dogs : [])
    let person3 = Person(name : "Franco", identifier : "?????????", age : 26, dogs : [])
    
    let personArray = [person1, person2, person3]
    
    var output = ""
    
    for person in  personArray {
        
    
        let personDogs = [Dog(name: "Bruno", color: "Negro", age: 5), Dog(name: "Laica", color: "Blanco", age: 3)]
        
        person.dogs = personDogs
        
        var dogInfo = ""
        
        for (index, dog) in person.dogs.enumerated() {
            dogInfo += """
            Dog \(index + 1) :
            \t\(dog.toString())
            """
        }
        
        output =  """
        \(person.toString())
        \t\(dogInfo)
        """
        print(output)
    }
}

func primeNumbers(input : Int) -> [Int] {
    
    var output = [Int]()
    
    if(input <= 1) {
        return output
    } else {
        
        for number in 2...input {
            
            var prime = true
            
            print("Numbers \(number)")
            var i = 2
            
            while i  < number {
                
                if(number % i == 0){
                    prime = false
                    break
                }
                
                i += 1
            }
            
            if(prime) {
                output.append(number)
            }
         
        }
    }
    
    return output
}

func arraymerge(firstInput : [Int], secondInput : [Int]) -> [Int] {
    let newArray = firstInput + secondInput
    return newArray.sorted()
}

PeopleInitializer()
primeNumbers(input : 20)
arraymerge(firstInput: [4,2,5], secondInput: [20, 12, 1])
