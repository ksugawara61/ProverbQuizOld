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
    
    @IBOutlet var authorImageView: UIImageView!
    @IBOutlet var resultLavel: UILabel!
    @IBOutlet var proverbTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        print(status)
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
