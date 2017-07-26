//
//  QuizViewController.swift
//  ProverbQuiz
//
//  Created by 菅原勝也 on 2017/07/20.
//  Copyright © 2017年 nttr.inc. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var index: Int!
    var quizArray: [Quiz]!
    var quiz:   Quiz!
    var status: Bool!
    
    @IBOutlet var quizLabel:     UILabel!
    @IBOutlet var quizTextView:  UITextView!
    @IBOutlet var option1Button: UIButton!
    @IBOutlet var option2Button: UIButton!
    @IBOutlet var option3Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setUpQuiz()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // クイズの初期設定
    func setUpQuiz() {
        quiz = quizArray[index]
        quizLabel.text = "問 " + String(index + 1)
        quizTextView.text = quiz.answer["proverb"]
        option1Button.setTitle(quiz.option1["name"], for: .normal)
        option1Button.titleLabel!.font = UIFont(name: "HiraMinProN-W6", size: 18)
        option2Button.setTitle(quiz.option2["name"], for: .normal)
        option2Button.titleLabel!.font = UIFont(name: "HiraMinProN-W6", size: 18)
        option3Button.setTitle(quiz.option3["name"], for: .normal)
        option3Button.titleLabel!.font = UIFont(name: "HiraMinProN-W6", size: 18)
    }
    
    @IBAction func selectOption1() {
        if option1Button.titleLabel?.text == quiz.answer["name"] {
            status = true
        } else {
            status = false
        }
        
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }

    @IBAction func selectOption2() {
        if option2Button.titleLabel?.text == quiz.answer["name"] {
            status = true
        } else {
            status = false
        }
        
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    @IBAction func selectOption3() {
        if option3Button.titleLabel?.text == quiz.answer["name"] {
            status = true
        } else {
            status = false
        }
        
        self.performSegue(withIdentifier: "toDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController = segue.destination as! ResultViewController
        resultViewController.index = index + 1
        resultViewController.quizArray = quizArray
        resultViewController.status = status
        resultViewController.imageName = quiz.answer["image"]
        resultViewController.proverb = quiz.answer["proverb"]
        resultViewController.author  = quiz.answer["name"]
    }
    
}
