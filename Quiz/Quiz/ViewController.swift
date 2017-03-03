//
//  ViewController.swift
//  Quiz
//
//  Created by Tuan Pham on 2/26/17.
//  Copyright © 2017 Tuan Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["From what is cognac made?",
                               "What is 7+77?",
                               "What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes",
                            "14",
                            "Montpelier"]
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }
    
    //Animate the question label when user clicks on next question button
    func animateLabelTransitions() {
        //Animate the alpha
        UIView.animate(withDuration: 0.5, animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
        })
    }
    
    //question label will not appear on screen when the app first loads
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Set the label's initial alpha
        nextQuestionLabel.alpha = 0
    }

}

