//
//  ResultViewController.swift
//  ProverbQuiz
//
//  Created by 菅原勝也 on 2017/07/20.
//  Copyright © 2017年 nttr.inc. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var status: Bool!
    var proverb: String!
    var author:  String!
    
    var authors = [["name": "ニーチェ", "image": "ni-che"],
                   ["name": "アリストテレス", "image": "aristoteles"],
                   ["name": "プラトン", "image": "platon"],
                   ["name": "アドラー", "image": "alfred_adler"],
                   ["name": "始皇帝", "image": "shikoutei"],
                   ["name": "徳川家康", "image": "ieyasu"],
                   ["name": "諸葛亮", "image": "koumei"],
                   ["name": "ガンジー", "image": "gandhi"],
                   ["name": "アインシュタイン", "image": "einstein"],
                   ["name": "ヘレン・ケラー", "image": "helen_keller"]]

    
    @IBOutlet var authorImageView: UIImageView!
    @IBOutlet var resultLavel: UILabel!
    @IBOutlet var proverbTextView: UITextView!
    @IBOutlet var authorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        print(status)
        proverbTextView.text = proverb
        authorLabel.text = author
        if (status) {
            resultLavel.text = "正解！"
        } else {
            resultLavel.text = "残念..."
            resultLavel.textColor = UIColor.red
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
