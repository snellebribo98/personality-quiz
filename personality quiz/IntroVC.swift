//
//  ViewController.swift
//  personality quiz
//
//  Created by Brian van de Velde on 19-11-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit

class IntroVC: UIViewController
{
    // set variables
    var quizChoose: String = ""
    
    // set initial screen
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    // unwind destination
    @IBAction func unwindQuiz(segue:UIStoryboardSegue) { }
    
    // If button pressed assign correct quiz
    @IBAction func animalButtonPressed(_ sender: Any)
    {
        quizChoose = "Animal"
        performSegue(withIdentifier: "startQuiz", sender: nil)
    }
    
    // If button pressed assign correct quiz
    @IBAction func basketballButtonPressed(_ sender: Any)
    {
        quizChoose = "Basketball"
        performSegue(withIdentifier: "startQuiz", sender: nil)
    }
    
    // gives the correct quiz to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "startQuiz"
        {
            let NavigationController = segue.destination as! UINavigationController
            let VC = NavigationController.topViewController as! QuestionsVC
            VC.quizChoose = quizChoose
        }
    }
}

