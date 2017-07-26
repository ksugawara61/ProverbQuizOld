//
//  ResultViewController.swift
//  ProverbQuiz
//
//  Created by 菅原勝也 on 2017/07/20.
//  Copyright © 2017年 nttr.inc. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var index: Int!
    var quizArray: [Quiz]!
    var status: Bool!
    var imageName: String!
    var proverb: String!
    var author:  String!
    
    @IBOutlet var authorImageView: UIImageView!
    @IBOutlet var resultLavel: UILabel!
    @IBOutlet var proverbTextView: UITextView!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var nextQuizButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.hidesBackButton = true
        if index >= Constant.maxQuizNum {
            nextQuizButton.setTitle("結果発表", for: .normal)
        } else {
            nextQuizButton.setTitle("次の問題", for: .normal)
        }
        nextQuizButton.titleLabel!.font = UIFont(name: "HiraMinProN-W6", size: 18)

        authorImageView.image = UIImage(named: imageName)
        proverbTextView.text = proverb
        authorLabel.text = author
        if (status) {
            resultLavel.text = "正解！"
            
            // スコアを加算
            let userDefaults = UserDefaults.standard
            var score = userDefaults.integer(forKey: "Score")
            score = score + 1
            userDefaults.set(score, forKey: "Score")
            userDefaults.synchronize()
            
        } else {
            resultLavel.text = "残念..."
            resultLavel.textColor = UIColor.red
        }
    }
    
    @IBAction func nextQuiz() {
        if index < Constant.maxQuizNum {
            self.performSegue(withIdentifier: "toNext", sender: nil)
        } else {
            // 最終問題であればトップページへ遷移
            self.performSegue(withIdentifier: "toEnd", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if index < Constant.maxQuizNum {
            let quizViewController = segue.destination as! QuizViewController
            quizViewController.index = index
            quizViewController.quizArray = quizArray
        } else {
            let endViewController = segue.destination as! EndViewController
            endViewController.quizArray = quizArray
        }
    }

}
