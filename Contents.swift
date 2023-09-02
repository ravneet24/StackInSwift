import UIKit


//First I build for Integer type only then we build Generic Stack
//For integer
struct Stack {
    private var elements = [Int]()
    
    init() {}
    
    mutating func push(element: Int) {
        elements.append(element)
    }
    
    mutating  func pop() -> Int {
        elements.removeLast()
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return """
      --------- Top ---------
      \(elements.map({ input in
          "\(input)"
      }).reversed().joined(separator: "\n"))
      """
    }
}

var stack = Stack()
stack.push(element: 1)
stack.push(element: 2)
stack.push(element: 3)

print(stack)
stack.pop()

print(stack)



// --------------- Generic Stack -----------

struct GenericStack<GenericType> {
    private var elements = [GenericType]()
    
    init() {}
    
    mutating func push(element: GenericType) {
        elements.append(element)
    }
    
    mutating  func pop() -> GenericType {
        elements.removeLast()
    }
    
    //More helper methods
     func peek() -> GenericType? {
        elements.last
    }
    
     func isEmpty() -> Bool {
        elements.last == nil
    }
}

extension GenericStack: CustomStringConvertible {
    var description: String {
        return """
          --------- Top ---------
          \(elements.map({ input in
              "\(input)"
          }).reversed().joined(separator: "\n"))
          """
    }
}

var genericStackInstance = GenericStack<String>()

genericStackInstance.isEmpty()

genericStackInstance.push(element: "R")
genericStackInstance.push(element: "A")
genericStackInstance.push(element: "V")
genericStackInstance.push(element: "N")
genericStackInstance.push(element: "E")
genericStackInstance.push(element: "E")
genericStackInstance.push(element: "T")

genericStackInstance.isEmpty()

print(genericStackInstance)
genericStackInstance.peek()

genericStackInstance.pop()

print(genericStackInstance)


// ---------- More features ---> convert array to stack

extension GenericStack {
    init(array: [GenericType]) {
        self.elements = array
    }
}

var stackFromArray = GenericStack(array: [1,2,3,4,5])
print(stackFromArray)



// ---------- More features ---> initialize stack from Array Literals

extension GenericStack: ExpressibleByArrayLiteral {
    typealias ArrayLiteralElement = GenericType
    init(arrayLiteral elements: GenericType...) {
        self.elements = elements
    }
}

var stackFromArrayLiteral: GenericStack = ["A","B","C"]
print(stackFromArrayLiteral)
stackFromArrayLiteral.pop()
print(stackFromArrayLiteral)
