class Animal0 {
    var brain: Bool = true
    var legs: Int = 0
}

class Animal1 {
    var brain: Bool
    var legs: Int

    init() {
        self.brain = true
        self.legs = 0
    }
}

class Animal2 {
    var brain: Bool
    var legs: Int

    init(brain: Bool, legs: Int) {
        self.brain = brain
        self.legs = legs
    }
}
let anima2 = Animal2(brain: true, legs: 0)
// Initialize 이해를 위해 test 작성


class Animal {
    var brain: Bool
    var legs: Int

    init() {
        brain = true
        legs = 0
    }
}

class Human: Animal {
    override var legs: Int {
        get {
            super.legs
        } set {
            super.legs = newValue
        }
    }

    override init() {
        super.init() // class Animal의 init을 호출 - 부모 클래스의 init이라 super를 붙여준다.
        self.legs = 2
    }
}

class Pet: Animal {
    override var legs: Int {
        get {
            super.legs
        }
        set {
            super.legs = newValue
        }
    }
    override init() {
        super.init()
        self.legs = 4
    }
    var fleas = 0
}

class Dog: Pet {
    override var fleas: Int {
        get {
            super.fleas
        }
        set {
            super.fleas = newValue
        }
    }
    override init() {
        super.init()
        self.fleas = 8
    }
}

class Cat: Pet {
    override var fleas: Int {
        get {
            super.fleas
        }
        set {
            super.fleas = newValue
        }
    }
    override init() {
        super.init()
        self.fleas = 4
    }
}

let animal = Animal()
animal.legs
animal.brain

let human = Human()
human.legs

let pet = Pet()
pet.fleas
pet.legs

let dog = Dog()
dog.fleas

let cat = Cat()
cat.fleas

