//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Tony Alhwayek on December 22, 2022
//
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    var useless = 0
    
    var timer = Timer()
    
    struct QuizQuestions {
        var question: String
        var answer: String
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    // When button is pressed
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        timer.invalidate()
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        // Set button background color on button choice
        // Green for correct
        // Red for incorrect
        if (userGotItRight) {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        // Ask next question
        quizBrain.nextQuestion()
        
        // Timer to show button background color for 0.2 seconds
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector:#selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    // Update text so that a new question is presented
    // Update scoreLabel with new score
    // Reset button backgrounds
    // Update progress bar
    // Invalidate timer (just in case)
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        timer.invalidate()
        
    }
}

