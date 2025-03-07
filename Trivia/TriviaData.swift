//
//  TriviaData.swift
//  Trivia
//
//  Created by Meredith Luo on 2025/3/7.
//

import UIKit

struct Question {
    let question: String
    let category: Category
    let options: [String]
    let correctIndex: Int
}

enum Category: String {
    case history
    case popCulture
    case biology
    
    var description: String {
        switch self {
        case .history:
            return "History"
        case .popCulture:
            return "Pop Culture"
        case .biology:
            return "Biology"
        }
    }
}

let question1 = Question(
    question: "Who was the first President of the United States?",
    category: .history,
    options:["Thomas Jefferson","George Washington","Abraham Lincoln","John Adams"],
    correctIndex:1)

let question2 = Question(
    question: "Which TV show features a coffee shop called Central Perk?",
    category: .popCulture,
    options:["Friends","How I Met Your Mother","Seinfeld","The Big Bang Theory"],
    correctIndex:0)

let question3 = Question(
    question: "What is the powerhouse of the cell?",
    category: .biology,
    options:["Nucleus","Mitochondria","Ribosome","Golgi Apparatus"],
    correctIndex:1)

let triviaQuestions = [question1, question2, question3]

