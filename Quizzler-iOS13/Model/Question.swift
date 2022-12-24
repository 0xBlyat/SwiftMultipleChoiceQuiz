//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Tony Alhwayek on December 22, 2022
//

import Foundation

// Question struct
struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        text = q
        answer = a
        self.correctAnswer = correctAnswer
    }
}
