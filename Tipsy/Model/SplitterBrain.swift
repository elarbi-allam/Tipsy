import Foundation

struct SplitterBrain {
    var bill: Double?
    var tipPercentage: Double?
    var numberOfPeople: Int?
    
    func totalPerPerson() -> Double? {
        let total = (bill ?? 0.0) * (1 + (tipPercentage ?? 0))
        
        return total / Double(numberOfPeople ?? 1)
    }
}
