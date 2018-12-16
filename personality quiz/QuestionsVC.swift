//
//  QuestionsVC.swift
//  personality quiz
//
//  Created by Brian van de Velde on 19-11-18.
//  Copyright © 2018 Brian van de Velde. All rights reserved.
//

import UIKit



class QuestionsVC: UIViewController
{
    // Outlets
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
  
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    // Properties
    var questionIndex = 0
    var progressIndex = 0
    var answersChosen: [Answer] = []
    var quizChoose: String?
    var quiz: String = ""
    
    // questions
    var questions: [Question] = 
        [
        Question(text: "Which food do you like the most?", type: .single, quiz: "Animal", answers:
            [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Fish", type: .cat),
            Answer(text: "Carrots", type: .rabbit),
            Answer(text: "Corn", type: .turtle)
            ]),
        Question(text: "What is you speciality on and off the court?", type: .single, quiz: "Basketball", answers:
            [
            Answer(text: "Winning", type: .Jordan),
            Answer(text: "Scoring", type: .Kobe),
            Answer(text: "Clapping my hands", type: .Scalabrine),
            Answer(text: "Acting", type: .LeBron)
            ]),
        Question(text: "Which activities do you enjoy?", type: .multiple, quiz: "Animal", answers:
            [
            Answer(text: "Swimming", type: .turtle),
            Answer(text: "Sleeping", type: .cat),
            Answer(text: "Cuddling", type: .rabbit),
            Answer(text: "Eating", type: .dog)
            ]),
        Question(text: "What would you like to do when you retire?", type: .multiple, quiz: "Basketball", answers:
            [
            Answer(text: "Manage a losing team", type: .Jordan),
            Answer(text: "Nothing much, sleep and earn money while sleeping", type: .Kobe),
            Answer(text: "Go into the broadcasting business", type: .Scalabrine),
            Answer(text: "Manage a team (doesn't that sound awfully familiar)", type: .LeBron)
            ]),
        Question(text: "How much do you enjoy car rides?", type: .ranged, quiz: "Animal", answers:
            [
            Answer(text: "I dislike them", type: .cat),
            Answer(text: "I get a little nervous", type: .rabbit),
            Answer(text: "I barely notice them", type: .turtle),
            Answer(text: "I love them", type: .dog)
            ]),
        Question(text: "How much do you hate lossing?", type: .ranged, quiz: "Basketball", answers:
            [
            Answer(text: "I hate it the most", type: .Jordan),
            Answer(text: "I get angry on my teammates, I'm sure as hell not responsible", type: .Kobe),
            Answer(text: "I was sitting in stands, so I don't really mind", type: .Scalabrine),
            Answer(text: "I'm so used to it by now", type: .LeBron)
            ])
        ]
    
    // set initial screen and assign questions to selected quiz
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        if quizChoose == "Animal"
        {
            quiz = "Animal"
            questionIndex = 0
        }
        else if quizChoose == "Basketball"
        {
            quiz = "Basketball"
            questionIndex = 1
        }
        
        updateUI()
    }
    
    // updates the screen after each question is answered
    func updateUI()
    {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(progressIndex) / Float(questions.count / 2)
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)

        switch currentQuestion.type
        {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    // updates and enables the single question view
    func updateSingleStack(using answers: [Answer])
    {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    // updates and enables the multi question view
    func updateMultipleStack(using answers: [Answer])
    {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    // updates and enables the ranged question view
    func updateRangedStack(using answers: [Answer])
    {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    // appends answer after a button is pressed
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton)
    {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender
        {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
    
        nextQuestion()
    }
    
    // appends answers after buttons are selected
    @IBAction func multipleAnswerButtonPressed()
    {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
    // appends answer after a range slider is set
    @IBAction func rangedAnswerButtonPressed()
    {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    // function that leads to next question if there is any
    // otherwise shows to next view controller
    func nextQuestion()
    {
        questionIndex += 2
        progressIndex += 1
        
        if questionIndex < questions.count
        {
            updateUI()
        }
        else
        {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    // gives information from this view controller to the next view controller
    override func prepare(for segue: UIStoryboardSegue, sender:
    Any?)
    {
        if segue.identifier == "ResultsSegue"
        {
            let resultsViewController = segue.destination as! ResultsVC
            resultsViewController.responses = answersChosen
        }
    }
}
