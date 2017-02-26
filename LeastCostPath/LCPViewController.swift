//
//  ViewController.swift
//  LeastCostPath
//
//  Created by Anuvar, Rejah on 2/23/17.
//  Copyright © 2017 rejah. All rights reserved.
//

import UIKit

class LCPViewController: UIViewController {
    
    var pathManager = LCPManager()
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var outputTextView: UITextView!
    @IBOutlet weak var computeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func computeButtonAction() {
        if let inputString = inputTextView.text {
            let result = pathManager.getLowestCostPath(inputString: inputString)
            
            var output1 = ""
            var output2 = 0
            var output3: [Int] = []
            
            switch result.result {
            case .invalid:
                output1 = "Invalid input"
                output2 = result.cost
                output3 = result.path
                outputTextView.text = "\(output1)"
                showInvalidInputAlert()
            case .yes:
                output1 = "Yes"
                output2 = result.cost
                output3 = result.path

                outputTextView.text = "\(output1)\n\(output2)\n\(output3)"
            case .no:
                output1 = "No"
                output2 = result.cost
                output3 = result.path

                outputTextView.text = "\(output1)\n\(output2)\n\(output3)"
            }
        }
    }
    
    func showInvalidInputAlert() {
        // Create and show alert
        let alert = UIAlertController(title: "Invalid input", message: "Please enter the grid with columns(5-100) seperated by space and rows(1-10) seperated by new line", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
