import UIKit

class ViewController: UIViewController {
    
    var splitterBrain = SplitterBrain()

    @IBOutlet weak var billTextFiel: UITextField!
    @IBOutlet var tipButtons: [UIButton]!
    @IBOutlet weak var numberOfPeople: UILabel!
    
    
    @IBAction func tipButtonsClicked(_ sender: UIButton) {
        
        for button in tipButtons {
            if button == sender {
                button.isSelected = true
                
            } else {
                button.isSelected = false
            }
        }
    }
    @IBAction func stepperClicked(_ sender: UIStepper) {
        numberOfPeople.text = "\(Int(sender.value))"
    }
    
    @IBAction func calculateAction(_ sender: UIButton) {
        for button in tipButtons {
            if button.isSelected {
                let buttonTitle = button.titleLabel?.text ?? "0%"
                let titleWithoutPercent = String(buttonTitle.dropLast())
                let tipAsNumber = (Double(titleWithoutPercent) ?? 0.0) / 100.0
                splitterBrain.setTipPercentage(tipAsNumber)
            }
        }
        
        splitterBrain.setNumberOfPeople(Int(numberOfPeople.text!)!)
        splitterBrain.setBill(Double(billTextFiel.text ?? "0") ?? 0.0)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            
            destinationVC.billPerPerson = splitterBrain.totalPerPerson()
            destinationVC.numberOfPeople = splitterBrain.numberOfPeople
            destinationVC.tipPercentage = splitterBrain.tipPercentage
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

