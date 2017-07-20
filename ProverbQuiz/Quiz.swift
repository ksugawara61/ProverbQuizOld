//
//  Quiz.swift
//  ProverbQuiz
//
//  Created by 菅原勝也 on 2017/07/20.
//  Copyright © 2017年 nttr.inc. All rights reserved.
//

import UIKit

class Quiz: NSObject {

    // クイズ1つの問題がどんな値を扱うか宣言
    var text: String
    var option1: String
    var option2: String
    var option3: String
    var answer: String
    
    // Initializer(イニシャライザ) = 初期化処理
    init(text: String, option1: String, option2: String, option3: String, answer: String) {
        self.text = text
        self.option1 = option1
        self.option2 = option2
        self.option3 = option3
        self.answer = answer
    }
    
    // シャッフルするアルゴリズム(フィッシャー&イェーツ・アルゴリズム)
    class func shuffle(quizArray: [Quiz]) -> [Quiz] {
        var quiz = quizArray
        var shuffledQuizArray: [Quiz] = []
        for _ in 0..<quiz.count {
            let index = Int(arc4random_uniform(UInt32(quiz.count)))
            shuffledQuizArray.append(quiz[index])
            quiz.remove(at: index)
        }
        return shuffledQuizArray
    }

}
