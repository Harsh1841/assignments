//
//  Question .swift
//  PersonalityQuiz
//
//  Created by Student on 29/07/25.
//

import Foundation
struct Question{
    var text : String
    var type : ResponseType
    var answers : [Answer]
    
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer{
    var text :String
    var type :AnimalType
}

enum AnimalType : Character {
    case lion = "🦁" , cat = "🐱" , rabbit = "🐰" , turtle = "🐢"
    var definition : String {
        switch self {
        case .lion : return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat : return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit : return "You love evrything that's soft. You are healthy and fulll of energy."
        case .turtle :
            return "You are wise beyong your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}

var questions : [Question] = [
    Question(text: "Which food do you like the most?", type: .single, answers: [Answer(text: "Steak", type: .lion),Answer(text: "Fish", type: .cat),Answer(text: "Carrots", type: .rabbit),Answer(text: "Corn", type: .turtle)]),
    Question(text: "Which activities do you enjoy?", type: .multiple, answers: [Answer(text: "Swimming", type: .turtle),Answer(text: "Sleeping", type: .cat),Answer(text: "Cuddling", type: .rabbit),Answer(text: "Eating", type: .lion)]),
    Question(text: "How much do you enjoy car rides?", type: .ranged, answers: [Answer(text: "I dislike them", type:.cat),Answer(text: "I get a little nervous", type: .rabbit),Answer(text: "I barely notice them", type: .turtle),Answer(text: "I love them", type: .lion)])
    
]
