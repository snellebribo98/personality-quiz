//
//  QuestionsData.swift
//  personality quiz
//
//  Created by Brian van de Velde on 19-11-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import Foundation

struct Question
{
    var text: String
    var type: ResponseType
    var quiz: String
    var answers: [Answer]
}

enum ResponseType
{
    case single, multiple, ranged
}

struct Answer
{
    var text: String
    var type: Type
}

enum Type: String
{
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢", Jordan = "Jordan", Kobe = "Kobe", Scalabrine = "Scalabrine", LeBron = "LeBron"
    
    var definition: String
    {
        switch self
        {
        case .dog:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your friends."
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms."
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and youfocus on the details. Slow and steady wins the race."
        case .Jordan:
            return "You're the greatest of all time... But let's just keep it at playing basketball"
        case .Kobe:
            return "You're the most selfish player on the court, but good at what you do"
        case .Scalabrine:
            return "You think you're the best, but everyone makes fun of your skills"
        case .LeBron:
            return "You're the only one in the world who thinks you're the best in what you do"
        }
    }
}
