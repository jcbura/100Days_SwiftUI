import Cocoa

class Animal {
    let legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    func speak() {
        print("Bark")
    }
}

class Corgi: Dog {
    override func speak() {
        print("Bark bark bark")
    }
}

class Poodle: Dog {
    override func speak() {
        print("Bark bark")
    }
}

class Cat: Animal {
    let isTame: Bool
    
    init(legs: Int, isTame: Bool) {
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        if isTame {
            print("Meow")
        } else {
            print("MEOW")
        }
    }
}

class Persian: Cat {
    override func speak() {
        if isTame {
            print("Meow meow")
        } else {
            print("MEOW MEOW")
        }
    }
}

class Lion: Cat {
    override func speak() {
        if isTame {
            print("Roar")
        } else {
            print("ROAR")
        }
    }
}

let lion = Lion(legs: 4, isTame: false)
lion.speak()
