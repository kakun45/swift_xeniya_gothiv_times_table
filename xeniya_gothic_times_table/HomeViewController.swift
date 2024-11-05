//
//  ViewController.swift
//  xeniya_gothic_times_table
//
//  Created by Xeniya Shoiko on 11/1/24.
//

import UIKit


class HomeViewController: UIViewController {

    @IBOutlet var a_var: UILabel!
    @IBOutlet var b_var: UILabel!
    
    // Get User Input:
    @IBOutlet var userGuess: UITextField!
    // info textLabel
    @IBOutlet var inputInfoLabel: UILabel!
    
    var currentA: Int  = 0
    var currentB: Int  = 0
    var currentResult: Int  = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Set keyboard type to number pad
        userGuess.keyboardType = .numberPad
        // remove keyboard from screen https://www.youtube.com/watch?v=pD3gsZ1Tcmw
        
        // Automatically focus on the UITextField (optional)
        // userGuess.becomeFirstResponder() // side-effect: prevents keyboard to be seen
        generateProblem()
    }
    
    private func generateProblem() {
        currentA = randomNum()
        currentB = randomNum()
        a_var.text = String(currentA)
        b_var.text = String(currentB)
        currentResult = currentA * currentB
        print("mult res: \(currentResult)")
    }
    
    @IBAction func userChoiceBtn(_ sender: UIButton) {
        // Get user input from text field
        guard let userInput = userGuess.text?.trimmingCharacters(in: .whitespacesAndNewlines),
              let userInpNumber = Int(userInput) else {
            inputInfoLabel.text = "Please, enter a valid number."
            
            userGuess.text = ""
            // Hide the info msg after 3sec delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        self.inputInfoLabel.text = ""
                    }
                                          
            return
        }
        
        if currentResult == userInpNumber {
//            resultLabel.text = "Your guess: \(userInpNumber) is correct"
//            resultLabel.textColor = .green
            print("Your guess: \(userInpNumber) is correct")
        } else {
//            resultLabel.text = "Your guess: \(userInpNumber) is INcorrect"
//            resultLabel.textColor = .red
            print("!Your guess: \(String(describing: userInpNumber)) is INcorrect! currentResult: \(currentResult)")
        }
        // Clear the text field & reset a problem
        userGuess.text = ""
        generateProblem()

    }
    
}

