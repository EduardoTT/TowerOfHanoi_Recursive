//Author: Eduardo Tolmasquim
//Recursive implementation of Tower of Hanoi

enum Position {
    case p1,p2,p3
    
    static func other(then firstPos:Position, and secondPos:Position)->Position {
        let position : Set<Position> = [.p1,.p2,.p3]
        let positionLeft = position.subtracting([firstPos,secondPos])
        return positionLeft.first!
    }
}

var steps = 0
var pile = [Position:[Int]]()

func moveDisk(from origin: Position, to destiny:Position) {
    let disk = pile[origin]?.removeLast()
    pile[destiny]?.append(disk!)
    steps += 1
}

func moveTower(tam:Int, from origin:Position, to destiny:Position) {
    if (tam == 1) {
        moveDisk(from: origin, to: destiny)
    } else {
        let workPile = Position.other(then: origin, and: destiny)
        moveTower(tam: tam-1, from: origin, to: workPile)
        moveDisk(from: origin, to: destiny)
        moveTower(tam: tam-1, from: workPile, to: destiny)
    }
}

pile[.p1] = [8,7,6,5,4,3,2,1]
pile[.p2] = []
pile[.p3] = []

moveTower(tam: 8, from: .p1, to: .p3)
print("pile 1:\(pile[.p1]!), pile 2:\(pile[.p2]!), pile 3: \(pile[.p3]!)")
print("steps: \(steps)")
