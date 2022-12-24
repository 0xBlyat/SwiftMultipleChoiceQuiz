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
    
    
    @IBOutlet var option1: UIButton!
    
    @IBOutlet var option2: UIButton!
    
    @IBOutlet var option3: UIButton!
    
    
    @IBOutlet var scoreLabel: UILabel!
    

    
    var quizBrain = QuizBrain()
    
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
        
        // Timer to show button background color for 0.3 seconds
        _ = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector:#selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    // Update text so that a new question is presented
    // Update scoreLabel with new score
    // Reset button backgrounds
    // Update progress bar
    // Invalidate timer (just in case)
    @objc func updateUI() {
        // Get question text
        questionLabel.text = quizBrain.getQuestionText()
        
        // Use the three on-screen buttons to show multiple choice answers
        option1.setTitle(quizBrain.getQuestionAnswers()[0], for: .normal)
        option2.setTitle(quizBrain.getQuestionAnswers()[1], for: .normal)
        option3.setTitle(quizBrain.getQuestionAnswers()[2], for: .normal)
        
        // Reset background colors after displaying red/green for correct/incorrect, respectively
        option1.backgroundColor = UIColor.clear
        option2.backgroundColor = UIColor.clear
        option3.backgroundColor = UIColor.clear
        
        // Update progress bar
        progressBar.progress = quizBrain.getProgress()
        
        // Update score
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
}

