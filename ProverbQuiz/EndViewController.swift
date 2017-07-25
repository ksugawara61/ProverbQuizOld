//
//  EndViewController.swift
//  ProverbQuiz
//
//  Created by 菅原勝也 on 2017/07/25.
//  Copyright © 2017年 nttr.inc. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {
    
    var okNum: Int!
    var quizArray: [Quiz]!
    
    @IBOutlet var authorImageView: UIImageView!
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var commentLabel: UILabel!
    @IBOutlet var proverbTextView: UITextView!
    @IBOutlet var authorLabel:  UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(EndViewController.navBackToTop(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton
        
        // 画面のイメージを変更
        let elem = quizArray[Int(arc4random_uniform(UInt32(quizArray.count)))]
        authorImageView.image = UIImage(named: elem.answer["image"]!)
        proverbTextView.text = elem.answer["proverb"]
        authorLabel.text = elem.answer["name"]
        
        // 結果を描画
        let userDefaults = UserDefaults.standard
        let score = userDefaults.integer(forKey: "Score")
        resultLabel.text = String(score) + " / " + String(Constant.maxQuizNum)
        if (score == Constant.maxQuizNum) {
            commentLabel.text = "おめでとう！！"
        } else if (score > 3) {
            commentLabel.text = "惜しい！"
        } else if (score > 1) {
            commentLabel.text = "頑張れ！"
        } else {
            commentLabel.text = "残念..."
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backToTop() {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func navBackToTop(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }

}
