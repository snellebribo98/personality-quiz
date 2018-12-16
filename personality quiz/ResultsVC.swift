//
//  ResultsVC.swift
//  personality quiz
//
//  Created by Brian van de Velde on 19-11-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class ResultsVC: UIViewController
{
    // set outlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDefinition: UILabel!
    
    // set variables
    var responses: [Answer]!
    
    // set initial screen
    override func viewDidLoad()
    {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    // calculates what you are with the given answers
    func calculatePersonalityResult()
    {
        var frequencyOfAnswers: [Type: Int] = [:]
        
        let responseTypes = responses.map { $0.type }
        
        for response in responseTypes
        {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnswersSorted = frequencyOfAnswers.sorted(by: { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value })
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinition.text = mostCommonAnswer.definition
        
    }

}
