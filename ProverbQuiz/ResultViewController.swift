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
            let newBackButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(ResultViewController.backToTop(sender:)))
            self.navigationItem.leftBarButtonItem = newBackButton
            nextQuizButton.setTitle("戻る", for: .normal)
        } else {
            nextQuizButton.setTitle("次の問題", for: .normal)
        }
        nextQuizButton.titleLabel!.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 18)

        authorImageView.image = UIImage(named: imageName)
        proverbTextView.text = proverb
        authorLabel.text = author
        if (status) {
            resultLavel.text = "正解！"
        } else {
            resultLavel.text = "残念..."
            resultLavel.textColor = UIColor.red
        }
    }
    
    @IBAction func nextQuiz() {
        print(index)
        if index < Constant.maxQuizNum {
            self.performSegue(withIdentifier: "toNext", sender: nil)
        } else {
            // 最終問題であればトップページへ遷移
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    func backToTop(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let quizViewController = segue.destination as! QuizViewController
        quizViewController.index = index
        quizViewController.quizArray = quizArray
    }

}
