//
//  ViewController.swift
//  personality quiz
//
//  Created by Brian van de Velde on 19-11-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class IntroVC: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    @IBAction func startQuizPressed(_ sender: Any)
    {
        performSegue(withIdentifier: "startQuiz", sender: nil)
    }
    
    @IBAction func unwindToQuizIntroduction(segue: UIStoryboardSegue) {}
}

