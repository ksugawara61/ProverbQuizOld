//
//  QuizViewController.swift
//  ProverbQuiz
//
//  Created by 菅原勝也 on 2017/07/20.
//  Copyright © 2017年 nttr.inc. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quiz:   Quiz!
    var status: Bool!
    
    @IBOutlet var quizTextView:  UITextView!
    @IBOutlet var option1Button: UIButton!
    @IBOutlet var option2Button: UIButton!
    @IBOutlet var option3Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpQuiz()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // クイズの初期設定
    func setUpQuiz() {
        quiz = Quiz(text: "自分に打ち勝つことが、最も偉大な勝利である。",
                    option1: "ニーチェ",
                    option2: "プラトン",
                    option3: "アリストテレス",
                    answer: "プラトン")
        
        quizTextView.text = quiz.text
        option1Button.setTitle(quiz.option1, for: .normal)
        option1Button.titleLabel!.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 18)
        option2Button.setTitle(quiz.option2, for: .normal)
        option2Button.titleLabel!.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 18)
        option3Button.setTitle(quiz.option3, for: .normal)
        option3Button.titleLabel!.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 18)
    }
    
    @IBAction func selectOption1() {
        if option1Button.titleLabel?.text == quiz.answer {
            status = true
        } else {
            status = false
        }
        print(status)
    }

    @IBAction func selectOption2() {
        if option2Button.titleLabel?.text == quiz.answer {
            status = true
        } else {
            status = false
        }
        print(status)
    }
    
    @IBAction func selectOption3() {
        if option3Button.titleLabel?.text == quiz.answer {
            status = true
        } else {
            status = false
        }
        print(status)
    }
    
}
