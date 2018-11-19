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
    var answers: [Answer]
}

enum ResponseType
{
    case single, multiple, ranged
}

struct Answer
{
    var text: String
    var type: AnimalType
}

enum AnimalType: Character
{
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
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
        }
    }
}
