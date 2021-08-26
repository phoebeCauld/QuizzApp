//
//  ViewController.swift
//  QuizzApp
//
//  Created by F1xTeoNtTsS on 25.08.2021.
//

import UIKit

class ViewController: UIViewController {

//    private let falseButton = UIButton()
    private let questionLabel = UILabel()
    private let progressBar = UIProgressView()
    private let trueFalse = ["TRUE","FALSE"]
    private let questions = [
        ["1+1=4", "FALSE"],
        ["lion is a king of animals", "TRUE"],
        ["you're perfect", "TRUE"],
        ["dimka is beautiful", "TRUE"],
        ["haha", "TRUE"]
    ]
    
    private var questionNumber = 0
    private let stackViewForButtons = UIStackView()
    private let bottomView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.1529959738, green: 0.1428803802, blue: 0.2865683734, alpha: 1)
        addSubviews()
       configurateViews()
    }

    func addSubviews(){
        view.addSubview(questionLabel)
        view.addSubview(stackViewForButtons)
        view.addSubview(bottomView)
        updateQuestions()
    }
    
    func configurateViews(){
// top
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont.systemFont(ofSize: 30)
        questionLabel.textColor = .white
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        questionLabel.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        questionLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        
  // center
        stackViewForButtons.axis = .vertical
        stackViewForButtons.distribution = .fillEqually
//        stackViewForButtons.spacing = 15
        stackViewForButtons.translatesAutoresizingMaskIntoConstraints = false
        stackViewForButtons.topAnchor.constraint(equalTo: questionLabel.bottomAnchor).isActive = true
        stackViewForButtons.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackViewForButtons.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.95).isActive = true
        stackViewForButtons.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                    multiplier: 0.2).isActive = true
        for i in 0...1 {
            let trueFalseButton = UIButton()
            trueFalseButton.setTitle(trueFalse[i], for: .normal)
            trueFalseButton.layer.cornerRadius = 20
            trueFalseButton.layer.borderWidth = 3
            trueFalseButton.layer.borderColor = UIColor.systemBlue.cgColor
            trueFalseButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            trueFalseButton.tintColor = .white
            trueFalseButton.backgroundColor = .clear
            trueFalseButton.titleLabel?.textAlignment = .center
            
            stackViewForButtons.addArrangedSubview(trueFalseButton)
            trueFalseButton.translatesAutoresizingMaskIntoConstraints = false
            trueFalseButton.widthAnchor.constraint(equalTo: stackViewForButtons.widthAnchor).isActive = true
            trueFalseButton.centerXAnchor.constraint(equalTo: stackViewForButtons.centerXAnchor).isActive = true
            trueFalseButton.heightAnchor.constraint(equalTo: stackViewForButtons.heightAnchor,
                                                    multiplier: 0.45).isActive = true
            
            trueFalseButton.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
    }
        
// bottom
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        bottomView.topAnchor.constraint(equalTo: stackViewForButtons.bottomAnchor).isActive = true
        bottomView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor,
                                                    multiplier: 0.2).isActive = true
        progressBar.progressTintColor = .systemBlue
        progressBar.trackTintColor = .systemGray
        progressBar.progress = 0
        
        bottomView.addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor).isActive = true
        progressBar.centerYAnchor.constraint(equalTo: bottomView.centerYAnchor).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 10).isActive = true
        progressBar.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.95).isActive = true
    }
    
    @objc func answerButtonPressed(_ sender: UIButton){
        guard let userAnswer = sender.currentTitle else { return }
        let rightAnswer = questions[questionNumber][1]
        let persentForProgressBar = Float(1) / Float(self.questions.count)
        if userAnswer == rightAnswer {
            if questionNumber < questions.count-1 {
                progressBar.progress += persentForProgressBar
                questionNumber+=1
                updateQuestions()
            } else {
                progressBar.progress += persentForProgressBar
                questionNumber = 0
                updateQuestions()
            }
        } else if userAnswer != rightAnswer {
            if progressBar.progress != 0 {
                progressBar.progress -= persentForProgressBar
            } else {
                return
            }
        }
    }
    private func updateQuestions(){
        questionLabel.text = questions[questionNumber][0]
    }
}

