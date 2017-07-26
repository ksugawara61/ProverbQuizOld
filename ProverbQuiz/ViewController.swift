//
//  ViewController.swift
//  ProverbQuiz
//
//  Created by 菅原勝也 on 2017/07/20.
//  Copyright © 2017年 nttr.inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
            let shuffledAuthors = shuffle(array: Constant.authors)
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

