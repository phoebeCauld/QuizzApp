//
//  QuizLogic.swift
//  QuizzApp
//
//  Created by F1xTeoNtTsS on 26.08.2021.
//

import Foundation

struct QuizLogic {
    private let questions = [
        Questions(question:"An octopus has three hearts", answer: "TRUE"),
        Questions(question: "Marrakesh is the capital of Morocco", answer: "FALSE"),
        Questions(question: "Idina Menzel sings 'let it go' 20 times in 'Let It Go' from Froze", answer: "FALSE"),
        Questions(question: "There are 219 episodes of Friends", answer: "FALSE"),
        Questions(question: "'A' is the most common letter used in the English language", answer: "FALSE"),
        Questions(question: "A lion's roar can be heard up to eight kilometres away", answer: "TRUE"),
        Questions(question: "In Harry Potter, Draco Malfoy has no siblings", answer: "FALSE"),
        Questions(question: "There are five different blood group", answer: "FALSE"),
        Questions(question: "Madonna's real name is Madonna", answer: "TRUE"),
        Questions(question: "Cinderella was the first Disney princess", answer: "FALSE"),
        Questions(question: "Alaska is the biggest American state in square miles", answer: "TRUE"),
        Questions(question: "Coffee is made from berries", answer: "TRUE"),
        
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == questions[questionNumber].answer{
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func questionText() -> String {
        return questions[questionNumber].question
    }
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(questions.count)
        return progress
    }
    
    mutating func nextQuestion(){
        if questionNumber < questions.count-1 {
            questionNumber+=1
        } else {
            questionNumber = 0
        }
    }
}
    

