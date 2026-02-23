import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var billPerPerson: Double?
    var tipPercentage: Double?
    var numberOfPeople: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        billLabel.text = "$\(billPerPerson ?? 0)"
        detailsLabel.text = "Split between \(numberOfPeople ?? 0) people, with a \(Int((tipPercentage ?? 0) * 100))% tip."
    }
    @IBAction func recalculate(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
