//
//  firstViewController.swift
//  ios-project-ui
//
//  Created by 李喜明 on 2019/9/26.
//  Copyright © 2019 李喜明. All rights reserved.
//

import UIKit

class firstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 0, y: 400, width: UIScreen.main.bounds.width, height: 30)
        button.setTitle("return bootControl", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.gray
        button.addTarget(self, action: #selector(jumpToReturn), for: .touchUpInside)
        self.view.addSubview(button)
    }
    @objc func jumpToReturn() {
        navigationController?.popViewController(animated: true)
        print("返回到第一个视图控制器")
    }

}
