//
//  ViewController.swift
//  ProverbQuiz
//
//  Created by 菅原勝也 on 2017/07/20.
//  Copyright © 2017年 nttr.inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var authors = [["name": "ニーチェ", "image": "ni-che", "proverb": "自分を破壊する一歩手前の負荷が、自分を強くしてくれる。"],
                   ["name": "アリストテレス", "image": "aristoteles", "proverb": "我々の性格は、我々の行動の結果なり。"],
                   ["name": "プラトン", "image": "platon", "proverb": "自分に打ち勝つことが、最も偉大な勝利である。"],
                   ["name": "アドラー", "image": "alfred_adler", "proverb": "もっとも重要な問いは「どこから」ではなくて「どこへ」である。"],
                   ["name": "始皇帝", "image": "shikoutei", "proverb": "天下が戦に苦しむのは、諸侯があるからだ。"],
                   ["name": "徳川家康", "image": "ieyasu", "proverb": "戦いでは強い者が勝つ。辛抱の強い者が。"],
                   ["name": "諸葛亮", "image": "koumei", "proverb": "無欲でなければ志は立たず、穏やかでなければ道は遠い。"],
                   ["name": "ガンジー", "image": "gandhi", "proverb": "速度を上げるばかりが、人生ではない。"],
                   ["name": "アインシュタイン", "image": "einstein", "proverb": "天才とは努力する凡才のことである。"],
                   ["name": "ヘレン・ケラー", "image": "helen_keller", "proverb": "人生はどちらかです。勇気をもって挑むか、棒にふるか。"]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectQuiz() {
        self.performSegue(withIdentifier: "toQuiz", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // クイズの生成
        var quizArray: [Quiz] = []
        for _ in 1...Constant.maxQuizNum {
            let shuffledAuthors = shuffle(array: authors)
            let quiz = Quiz(option1: shuffledAuthors[0],
                        option2: shuffledAuthors[1],
                        option3: shuffledAuthors[2],
                        answer: shuffledAuthors[Int(arc4random_uniform(3))])
            quizArray.append(quiz)
        }
        
        // スコアを初期化
        let userDefaults = UserDefaults.standard
        userDefaults.set(0, forKey: "Score")
        userDefaults.synchronize()
        
        // QuizViewControllerへ値渡し
        let quizViewController = segue.destination as! QuizViewController
        quizViewController.index = 0
        quizViewController.quizArray = quizArray
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

}

