import Foundation

struct SplitterBrain {
    var bill: Double?
    var tipPercentage: Double?
    var numberOfPeople: Int?
    
    mutating func setBill(_ bill: Double) {
        self.bill = bill
    }
    
    mutating func setTipPercentage(_ tipPercentage: Double) {
        self.tipPercentage = tipPercentage
    }
    
    mutating func setNumberOfPeople(_ numberOfPeople: Int) {
        self.numberOfPeople = numberOfPeople
    }
    
    func totalPerPerson() -> Double? {
        let total = (bill ?? 0.0) * (1 + (tipPercentage ?? 0))
        
        return total / Double(numberOfPeople ?? 1)
    }
}
