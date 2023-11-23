import UIKit

class ViewController: UIViewController {
    
    private enum MathAction: Int {
        case add = 1
        case subtract
        case multiply
        case division
        
    }
    
    
    private let mathActionMap: [MathAction: (Double, Double) -> Double] = [
        .add: { $0 + $1 },
        .subtract: { $0 - $1 },
        .multiply: { $0 * $1 },
        .division: { $0 / $1 }
    ]
    
    @IBOutlet private var rightactionButtons: [UIButton]!
    @IBOutlet private var topactionButtons: [UIButton]!
    @IBOutlet private var numbersactionButtons: [UIButton]!
    @IBOutlet private var resultLabel: UILabel!
    
    private var leftinput = "0"
    private var rightinput: String?
    private var selectedAction: MathAction?
    //    {
    //        didSet{
    //            if let selectedAction,
    //               let selectedButton = rightactionButtons.first(where: { $0.tag == selectedAction.rawValue}) {
    //                selectedButton.backgroundColor = .white
    //                selectedButton.tintColor = .systemOrange
    //            } else {
    //
    //            }
    //        }
    //    }
    //
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        for button in rightactionButtons {
            button.backgroundColor = .systemOrange
            button.tintColor = .white
            button.layer.cornerRadius = button.bounds.height / 2
        }
        for button in topactionButtons {
            button.backgroundColor = .lightGray
            button.tintColor = .black
            button.layer.cornerRadius = button.bounds.height / 2
        }
        for button in numbersactionButtons {
            button.backgroundColor = .darkGray
            button.tintColor = .white
            button.layer.cornerRadius = button.bounds.height / 2
        }
    }
    
    @IBAction func numberButtonTaped(_ sender: UIButton) {
        if selectedAction != nil{
            if let rightinput {
                if rightinput == "0", sender.tag == 0 {
                    return
                }
                
                if rightinput == "0" {
                    self.rightinput = "\(sender.tag)"
                } else {
                    self.rightinput = rightinput + "\(sender.tag)"
                }
                
            } else {
                rightinput = "\(sender.tag)"
            }
            
            resultLabel.text = rightinput
        } else {
            
            if leftinput == "0", sender.tag == 0 {
                return
            }
            
            if leftinput == "0"{
                leftinput = "\(sender.tag)"
            } else {
                leftinput += "\(sender.tag)"
            }
            
            resultLabel.text = leftinput
        }
    }
    
    
    @IBAction private func cometapped(_ sender: Any) {
        if selectedAction != nil {
            if let rightinput, !rightinput.contains(",") {
                self.rightinput = rightinput + ","
            } else {
                rightinput = "0,"
            }
            
            resultLabel.text = rightinput
        } else {
            
            
            if leftinput.contains(",") {
                return
            }
            
            leftinput += ","
            
            resultLabel.text = leftinput
        }
    }
    
    
    @IBAction func clearTapped(_ sender: Any) {
        leftinput = "0"
        rightinput = nil
        selectedAction = nil
        resultLabel.text = leftinput
    }
    
    @IBAction func PlusMinusTapped(_ sender: Any) {
        if selectedAction != nil {
            if let rightinput {
                if rightinput.starts(with: "-") {
                    self.rightinput = String(rightinput.dropFirst())
                } else {
                    self.rightinput = "-" + rightinput
                }
            } else {
                rightinput = "-0"
            }
            
            resultLabel.text = rightinput
        } else {
            
            
            if leftinput.starts(with: "-")
            {
                leftinput = String(leftinput.dropFirst())
            } else {
                leftinput = "-" + leftinput
            }
            resultLabel.text = leftinput
        }
    }
    @IBAction func pracentTapped(_ sender: Any) {
        guard let input = Double(leftinput.replacingOccurrences(of: ",", with: ".")) else {
            return
        }
        
        resultLabel.text = leftinput
        
        let result = input / 100
        
        leftinput = result.truncatingRemainder(dividingBy: 1) == .zero ?
        String(format: "%.0f", result):
        String(result).replacingOccurrences(of: ".", with: ",")
        
        resultLabel.text = leftinput
        
    }
    
    @IBAction func ActionButtonTapped(_ sender: UIButton) {
        guard let action = (MathAction(rawValue: sender.tag)) else { return }
        
        if
            let selectedAction,
            let rightinput,
            let lhs = Double(leftinput.replacingOccurrences(of: ",", with: ".")),
            let rhs = Double(rightinput.replacingOccurrences(of: ",", with: ".")){
            let result = mathActionMap[selectedAction]!(lhs, rhs)
            
            leftinput = result.truncatingRemainder(dividingBy: 1) == .zero ?
            String(format: "%.0f", result):
            String(result).replacingOccurrences(of: ".", with: ",")
            
            self.rightinput = nil
            
            resultLabel.text = leftinput
            
        }
        
        selectedAction = action
        
    }
    
    @IBAction func Equaltapped(_ sender: Any) {
        guard
            let selectedAction,
            let lhs = Double(leftinput.replacingOccurrences(of: ",", with: ".")) else {
            return
        }
        
        if let rightinput, let rhs = Double(rightinput.replacingOccurrences(of: ",", with: ".")) {
            let result = mathActionMap[selectedAction]!(lhs, rhs)
            
            leftinput = result.truncatingRemainder(dividingBy: 1) == .zero ?
            String(format: "%.0f", result):
            String(result).replacingOccurrences(of: ".", with: ",")
            
            self.rightinput = nil
            
            resultLabel.text = leftinput
            
            }else {
                let result = mathActionMap[selectedAction]!(lhs,lhs)
                
                leftinput = result.truncatingRemainder(dividingBy: 1) == .zero ?
                String(format: "%.0f", result):
                String(result).replacingOccurrences(of: ".", with: ",")
                
                self.rightinput = nil
                
                resultLabel.text = leftinput
                
            }
            
        }
        
        
        
    }
    
