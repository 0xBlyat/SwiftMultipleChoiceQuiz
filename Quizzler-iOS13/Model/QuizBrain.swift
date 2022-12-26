//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Tony Alhwayek on December 22, 2022
//

import Foundation

struct QuizBrain {
    // Array to store quiz questions
    var quiz = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia"),
        Question(q: "Where is the tallest building in the world located?", a: ["China", "Malaysia", "Dubai"], correctAnswer: "Dubai"),
        Question(q: "Who was the first woman to win a noble prize?", a: ["Marie Curie", "Lisa Meitner", "Gerty Cori"], correctAnswer: "Marie Curie"),
        Question(q: "Who was the first person to walk on the moon?", a: ["Buzz Aldrin", "Neil Armstrong", "John Glenn"], correctAnswer: "Neil Armstrong"),
        Question(q: "Who invented the computer?", a: ["Alan Turing", "Bill Gates", "Charles Babbage"], correctAnswer: "Charles Babbage")
    ]
    
    
    // Tracks question number
    var questionNumber = 0

    // Tracks score
    var score = 0

    // Tracks questions asked (to display score/questionsAsked)
    // var questionsAsked = 0
    
    // Checks if answer is correct or incorrect, and returns a bool with the appropriate answer
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if (userAnswer == quiz[questionNumber].correctAnswer) {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    // Returns question text
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    // Returns current progress to update progress bar
    func getProgress() -> Float {
        return Float(questionNumber + 1)/Float(quiz.count)
    }
    
    // Returns score
    func getScore() -> Int {
        return score
    }
    
    func getQuestionAnswers() -> [String] {
        return quiz[questionNumber].answer
    }
    
    mutating func nextQuestion() {
        // continue or reset quiz, based on how many questions have been asked
         if(questionNumber < (quiz.count - 1)) {
             questionNumber += 1
         } else {
             // Reset questions count and score on repeat
             questionNumber = 0
             score = 0
            // questionsAsked = 0
         }
    }
    
}
