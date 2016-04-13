//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

str = "Hello, Swift"

let constStr = str

let number = 42

let fmStation = 91.1

enum PieType :Int{
    case Apple = 3
    case Cherry
    case Pecan
}

let type = PieType(rawValue: 5)

struct Vector {
    var x:Double
    var y:Double
    
    init(){
        self.init(x: 0,y: 0)
    }
    
    init(x: Double, y: Double){
        self.x = x
        self.y = y
    }
}


let v = Vector(x: 1.0,y: 2.0)