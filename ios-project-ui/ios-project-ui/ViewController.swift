//
//  ViewController.swift
//  ios-project-ui
//
//  Created by 李喜明 on 2019/9/25.
//  Copyright © 2019 李喜明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 150))//create UILabel label
        label.text = "this is ios UILabel, lufanglan this is ios UILabel, lufanglan//setting the label body textthis is ios UILabel, lufanglanthis is ios UILabel, lufanglan this is ios UILabel, lufanglan//setting the label body textthis is ios UILabel, this is ios UILabel, lufanglan this is ios UILabel, lufanglan//setting the label body textthis is ios this is ios UILabel, lufanglan this is ios UILabel, lufanglan//setting the label body textthis is ios UILabel, lufanglan, lufanglan"
        label.textColor = UIColor.red//setting the font color
        label.textAlignment = NSTextAlignment.center//setting the text alignment way,the NSTextAlignment is eunm data type include center, right, left, bottom
        label.font = UIFont.boldSystemFont(ofSize: 20)//setting the size of font
        label.shadowColor = UIColor.green//setting text shadow color
        label.numberOfLines = 3//setting the text show number of lines
        label.backgroundColor = UIColor.brown
        self.view.addSubview(label)//add the UILabel to the main view
        //self.view.backgroundColor = UIColor.green
        
        
        let button = UIButton(type: UIButton.ButtonType.system)
        button.frame = CGRect(x: 40, y: 400, width: 100, height: 30)
        button.backgroundColor = UIColor.green
        button.setTitle("跳转下一个视图控制器", for:UIControl.State.normal)
        button.setTitleColor(UIColor.red, for: UIControl.State.normal)
        button.addTarget(self, action: #selector(clickButton) , for:UIControl.Event.touchUpInside)
        self.view.addSubview(button)
    }
    @objc func clickButton() {
        navigationController?.pushViewController(firstViewController(), animated: true)
        dismiss(animated: true, completion: nil)
        print("跳转到第二个视图控制器")
        
    }
}

