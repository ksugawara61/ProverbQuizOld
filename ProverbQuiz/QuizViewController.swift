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
    
    var authors = [["name": "ニーチェ", "image": "ni-che", "proverb": "足元を掘れそこに泉あり。"],
                   ["name": "アリストテレス", "image": "aristoteles", "proverb": "我々の性格は、我々の行動の結果なり。"],
                   ["name": "プラトン", "image": "platon", "proverb": "自分に打ち勝つことが、最も偉大な勝利である。"],
                   ["name": "アドラー", "image": "alfred_adler", "proverb": "もっとも重要な問いは「どこから」ではなくて「どこへ」である。"],
                   ["name": "始皇帝", "image": "shikoutei", "proverb": "天下が戦に苦しむのは、諸侯があるからだ。"],
                   ["name": "徳川家康", "image": "ieyasu", "proverb": "戦いでは強い者が勝つ。辛抱の強い者が。"],
                   ["name": "諸葛亮", "image": "koumei", "proverb": "無欲でなければ志は立たず、穏やかでなければ道は遠い。"],
                   ["name": "ガンジー", "image": "gandhi", "proverb": "速度を上げるばかりが、人生ではない。"],
                   ["name": "アインシュタイン", "image": "einstein", "proverb": "天才とは努力する凡才のことである。"],
                   ["name": "ヘレン・ケラー", "image": "helen_keller", "proverb": "人生はどちらかです。勇気をもって挑むか、棒にふるか。"]]

    @IBOutlet var quizTextView:  UITextView!
    @IBOutlet var option1Button: UIButton!
    @IBOutlet var option2Button: UIButton!
    @IBOutlet var option3Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true

        setUpQuiz()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
        
    // シャッフルするアルゴリズム(フィッシャー&イェーツ・アルゴリズム)
    func shuffle(array: [Dictionary<String, String>]) -> [Dictionary<String, String>] {
        var tmpArray = array
        var shuffledArray: [Dictionary<String, String>] = []
        for _ in 0..<tmpArray.count {
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            shuffledArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        return shuffledArray
    }

    // クイズの初期設定
    func setUpQuiz() {
        let shuffledAuthors = shuffle(array: authors)
        quiz = Quiz(option1: shuffledAuthors[0],
                    option2: shuffledAuthors[1],
                    option3: shuffledAuthors[2],
                    answer: shuffledAuthors[Int(arc4random_uniform(3))])
        
        quizTextView.text = quiz.answer["proverb"]
        option1Button.setTitle(quiz.option1["name"], for: .normal)
        option1Button.titleLabel!.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 18)
        option2Button.setTitle(quiz.option2["name"], for: .normal)
        option2Button.titleLabel!.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 18)
        option3Button.setTitle(quiz.option3["name"], for: .normal)
        option3Button.titleLabel!.font = UIFont(name: "TimesNewRomanPS-BoldMT", size: 18)
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
        resultViewController.status = status
        resultViewController.imageName = quiz.answer["image"]
        resultViewController.proverb = quiz.answer["proverb"]
        resultViewController.author  = quiz.answer["name"]
    }
    
}
