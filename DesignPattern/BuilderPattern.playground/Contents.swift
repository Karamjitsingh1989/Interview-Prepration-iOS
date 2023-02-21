import UIKit


class HtmlElement: CustomStringConvertible {
   
    var name = ""
    var text = ""
    var elements = [HtmlElement]()
    private let indentSize = 2
    
    init(){}
    
    init(_ name: String, _ text: String) {
        self.name = name
        self.text = text
    }
    
    private func description(_ indent: Int) -> String {
        
        var result = ""
        let i = String(repeating: " ", count: indent)
        result += "\(i)<\(name)>\n"
        
        
        if !text.isEmpty {
            
            result += String(repeating: " ", count:indentSize * ( indent + 1))
            result += text
            result += "\n"
        }
        
        for element in elements {
            result = element.description(indent + 1)
        }
        result += "\(i)</\(name)>\n"
        return result
    }
    
    var description: String {
        return description(0)
    }
}


class HtmlBuilder: CustomStringConvertible {
    
    private let rootName: String
    
    var root  = HtmlElement()
    
    init(_ rootName: String) {
        self.rootName = rootName
        self.root.name = rootName
    }
    
    
    func addChild(name: String, text: String) -> HtmlBuilder {
        
        let element = HtmlElement(name, text)
        root.elements.append(element)
        
        return self
        
    }
    
    var description: String {
        return root.description
    }
    
    func clear() {
        root = HtmlElement(rootName, "")
        
    }
}
/*
let builder = HtmlBuilder("ul")
builder.addChild(name: "li", text: "Hello")
builder.addChild(name: "li", text: "world")
        .addChild(name: "li", text: "Karam")
print(builder)

*/



class Person : CustomStringConvertible {
   
    
    var streetAddress = "" , postalCode = "", city = ""
    
    var companyName = "", position = ""
    
    var annualIcome = 0
    
    var description: String {
        
        return "I live at \(streetAddress), \(postalCode), \(city)" + "and works at \(companyName) as a \(position) annual Salary \(annualIcome)"
    }
    
}



class PersonBuilder {
    
    var person = Person()
    
    var lives: PersonAddress {
        return PersonAddress(person)
    }
    
    var works: PersonEmployee {
        return PersonEmployee(person)
    }
    
    func build()-> Person{
        return person
    }
}

class PersonAddress: PersonBuilder {
    
    internal init(_ person: Person) {
        super.init()
        self.person = person
    }
    
    func address(_ streetAddress: String)-> PersonAddress {
        
        person.streetAddress = streetAddress
        return self
    }
    
    func postalCode(_ postalCode: String)-> PersonAddress {
        
        person.postalCode = postalCode
        return self
    }
    
    func city(_ city: String) -> PersonAddress {
        
        person.city = city
        return self
    }
    
}


class PersonEmployee: PersonBuilder {
    
    internal init(_ person: Person) {
        super.init()
        self.person = person
    }
    
    func atCompany(_ companyName: String ) -> PersonEmployee {
        self.person.companyName  = companyName
        return self
    }
    
    func position(_ position: String ) -> PersonEmployee {
        self.person.position  = position
        return self
    }
    
    func annualIncome(_ annualIncome: Int ) -> PersonEmployee {
        self.person.annualIcome  = annualIncome
        return self
    }
}


let person = PersonBuilder()
let person1 = person.lives
                            .address("209/1 ACME Height 2, sector -117")
                            .postalCode("140301")
                            .city("Mohali")
                    .works
                            .atCompany("Publicis Sapient")
                            .position("Senior Associate Level 2")
                            .annualIncome(250000).build()
print(person1)
