//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Tony Alhwayek on December 22, 2022
//
//

import UIKit

class ViewController: UIViewController {
    // Question Label
    @IBOutlet var questionLabel: UILabel!
    
    // Progress Bar
    @IBOutlet var progressBar: UIProgressView!
    
    // Answer buttons
    @IBOutlet var option1: UIButton!
    @IBOutlet var option2: UIButton!
    @IBOutlet var option3: UIButton!
    
    // Score Label
    @IBOutlet var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Shuffle quiz questions
        quizBrain.quiz.shuffle()
        
        // Update UI
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
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        // Function call to ask next question in array
        quizBrain.nextQuestion()
        
        // Timer to show button background color for 0.3 seconds, then update UI
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector:#selector(updateUI), userInfo: nil, repeats: false)
    
    }
    
    // Update text so that a new question is presented
    // Update scoreLabel with new score
    // Reset button backgrounds
    // Update progress bar
    // Invalidate timer (just in case)
    @objc func updateUI() {
        // Get question text
        questionLabel.text = quizBrain.getQuestionText()
        
        // Shuffle answers just to add some randomness
        quizBrain.quiz[quizBrain.questionNumber].answer.shuffle()
        
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
        
        if quizBrain.hasReset == 1 {
            // Alert showing score and end of quiz
            let alert = UIAlertController(title: "You've finished the quiz", message: "Your got \(quizBrain.score) out of \(quizBrain.quiz.count) questions correct!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Restart?", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
            quizBrain.score = 0
            
            // Reset score label to 0
            scoreLabel.text = "Score: 0"
        }
    }
}

