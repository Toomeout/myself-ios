//
//  WeiXinViewController.swift
//  ios-project-ui
//
//  Created by 李喜明 on 2019/9/26.
//  Copyright © 2019 李喜明. All rights reserved.
//

import UIKit

class WeiXinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
        title = "微信"
        navigationItem.prompt = "您正在共享位置..."
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(nextPage))
        
        let label = UILabel(frame: CGRect(x: 0, y: 200, width: UIScreen.main.bounds.width, height: 200))
        label.text = "    my name is liixming , my girlfriend is lufanglan i am come from hunan provincemy name is liixming , my girlfriend is lufanglan i am come from hunan province my name is liixming , my girlfriend is lufanglan i am come from hunan province  my name is liixming , my girlfriend is lufanglan i am come from hunan provincemy name is liixming , my girlfriend is lufanglan i am come from hunan my name is liixming , my girlfriend is lufanglan i am come from hunan my name is liixming , my girlfriend is lufanglan i am come from hunan province"
        label.numberOfLines = 0
        label.shadowColor = UIColor.red
        label.shadowOffset = CGSize(width: 2, height: 2)
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.lineBreakMode = NSLineBreakMode.byTruncatingTail
        label.textAlignment = NSTextAlignment.left
        label.isEnabled = true
        label.backgroundColor = UIColor.green
        view.addSubview(label)
    }
    @objc func nextPage() {
        navigationController?.pushViewController(SecondViewController(), animated: true)
    }

}
