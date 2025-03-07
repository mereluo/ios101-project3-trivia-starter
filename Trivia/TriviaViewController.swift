//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Meredith Luo on 2025/3/7.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    
    private var correctCount = 0
    private var currQuestionIdx = 0
    private var correctOptionIdx = -1
    private var questionCount = triviaQuestions.count
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadCurrentQuestion()
    }
    
    func loadCurrentQuestion() {
        // handle the end of the question list
        guard currQuestionIdx < questionCount else {
            return
        }
        
        let currQuestion = triviaQuestions[currQuestionIdx]
        correctOptionIdx = currQuestion.correctIndex
        
        numberLabel.text = "Question: \(currQuestionIdx + 1)/\(questionCount)"
        categoryLabel.text = currQuestion.category.description
        questionLabel.text = currQuestion.question
        
        let buttons = [option1Button, option2Button, option3Button, option4Button]
        for (index, button) in buttons.enumerated() {
            button?.setTitle(currQuestion.options[index], for: .normal)
        }
    }
    
    func restartTrivia() {
        correctCount = 0
        currQuestionIdx = 0
        correctOptionIdx = -1
        loadCurrentQuestion()
    }
    
    func displayResult() {
        let result = "Final Score: \(correctCount)/\(questionCount)"
        let alertController = UIAlertController(title: "Game Over", message: result, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Restart", style: .default, handler: {_ in self.restartTrivia()}))
        
        present(alertController, animated: true, completion: nil)
    }
    
    func checkOption(optionIdx: Int) {
        if (optionIdx == correctOptionIdx) {
            correctCount += 1
        }
        currQuestionIdx += 1
        
        if (currQuestionIdx == questionCount) {
            displayResult()
        } else {
            loadCurrentQuestion()
        }
    }
    
    @IBAction func didTapOption1(_ sender: UIButton) {
        checkOption(optionIdx: 0)
    }
    
    @IBAction func didTapOption2(_ sender: UIButton) {
        checkOption(optionIdx: 1)
    }
    
    @IBAction func didTapOption3(_ sender: UIButton) {
        checkOption(optionIdx: 2)
    }
    
    @IBAction func didTapOption4(_ sender: UIButton) {
        checkOption(optionIdx: 3)
    }
    
}
