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
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
