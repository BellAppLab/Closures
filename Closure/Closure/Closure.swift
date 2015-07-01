//
//  Closure.swift
//
//

import Foundation


class Thing
{
    let name: String
    var size: Int?
    
    init(name: String, size: Int?)
    {
        self.name = name
        self.size = size
    }
    
    func giveNameIfSize() -> String?
    {
        if self.size != nil {
            return self.name
        }
        return nil
    }
}


typealias IterationBlock = (Thing) -> Bool


class Iterable
{
    private let array: Array<Thing>
    var count: Int {
        return self.array.count
    }
    
    init(array: [Thing])
    {
        self.array = array
    }
    
    func iterate(block: IterationBlock)
    {
        if self.count == 0 {
            return
        }
        
        for object in self.array {
            if block(object) {
                break
            }
        }
    }
    
    var description: String {
        var result = "Description:"
        self.iterate { (someThing) -> Bool in
            result += " " + someThing.name + ", "
            return false
        }
        return result
    }
}
