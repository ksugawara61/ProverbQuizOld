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
    var imageName: String!
    var proverb: String!
    var author:  String!
    
    @IBOutlet var authorImageView: UIImageView!
    @IBOutlet var resultLavel: UILabel!
    @IBOutlet var proverbTextView: UITextView!
    @IBOutlet var authorLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(ResultViewController.backToTop(sender:)))
        self.navigationItem.leftBarButtonItem = newBackButton

        print(status)
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

    func backToTop(sender: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func back() {
        //self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }

}
