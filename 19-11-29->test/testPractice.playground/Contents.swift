class Dog {
    let name: String
    let color: String
    let leg: Int
    
    init(name: String, color: String, leg: Int) {
        self.name = name
        self.color = color
        self.leg = leg
        
    }
    init(name: String) {
        self.name = name
        color = "Brown"
        leg = 3
    }
    init(name: String, color: String) {
        self.name = name
        self.color = color
        leg = 3
    }
    
    func bowwow() {
        print("Wis")
    }
}
var tory3 = Dog(name: "야", color: "오랑", leg: 3)
var tory4 = Dog(name: "dk", color: "dk")
