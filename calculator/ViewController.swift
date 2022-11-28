//
//  ViewController.swift
//  calculator
//
//  Created by Zakkariya K.A on 22/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculatorworkings: UITextField!
    @IBOutlet weak var calculaorresults: UITextField!
    
    var workings:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearAll()
        // Do any additional setup after loading the view.
    }

    func clearAll()
    {
        workings = ""
        calculatorworkings.text = ""
        calculaorresults.text = ""
        
    }
    @IBAction func allclear(_ sender: Any) {
        clearAll()
    }
    
    @IBAction func back(_ sender: Any) {
        if(!workings.isEmpty){
            workings.removeLast()
            calculatorworkings.text = workings
        }
    }
    
    func addtoworkings(value:String)
    {
        workings = workings+value
        calculatorworkings.text = workings
    }
    
    
    @IBAction func percentage(_ sender: Any) {
        addtoworkings(value: "%")
    }
    
    @IBAction func division(_ sender: Any) {
        addtoworkings(value: "/")
    }
    @IBAction func multiple(_ sender: Any) {
        addtoworkings(value: "*")
    }
    @IBAction func minus(_ sender: Any) {
        addtoworkings(value: "-")
    }
    @IBAction func plus(_ sender: Any) {
        addtoworkings(value: "+")
    }
  
    @IBAction func equalto(_ sender: Any) {
        let expression = NSExpression(format: workings)
        let result = expression.expressionValue(with: nil, context: nil) as! Double
        let resultString = formatresult(result: result)
        calculaorresults.text?.append(resultString)
    }
    func formatresult(result: Double) -> String
    {
        if(result.truncatingRemainder(dividingBy: 1) == 0)
        {
            return String(format: "%.0f", result)
        }
        else
        {
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func buttontapped(_ sender: UIButton) {
        if let value = sender.titleLabel?.text {
            addtoworkings(value: value)
        }
    }
}
    


