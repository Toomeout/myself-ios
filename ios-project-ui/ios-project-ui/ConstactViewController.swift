//
//  ConstactViewController.swift
//  ios-project-ui
//
//  Created by 李喜明 on 2019/9/26.
//  Copyright © 2019 李喜明. All rights reserved.
//

import UIKit

class ConstactViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.green
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 100, width: UIScreen.main.bounds.width, height: 30)
        button.backgroundColor = UIColor.gray
        button.setTitle("添加", for:UIControl.State.normal)
        button.setTitleColor(UIColor.red, for: UIControl.State.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 10)
        
        //button.setImage(UIImage(named: "me"), for: .normal)
        self.view.addSubview(button)
        
        let swi = UISwitch(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        swi.setOn(true, animated: true)
        swi.tintColor = UIColor.yellow
        swi.onTintColor = UIColor.purple
        swi.thumbTintColor = UIColor.black
        swi.addTarget(self, action: #selector(offAndOn), for: .valueChanged)
        self.viewIfLoaded?.addSubview(swi)
        
        let edit = UITextField(frame: CGRect(x: 10, y: 200, width: 300, height: 30))
        edit.backgroundColor = UIColor.white
        edit.borderStyle = UITextField.BorderStyle.roundedRect
        edit.placeholder = "请输入内容"
        edit.autocorrectionType = UITextAutocorrectionType.default
        edit.returnKeyType = UIReturnKeyType.done
        edit.clearButtonMode = UITextField.ViewMode.whileEditing
        edit.keyboardAppearance = UIKeyboardAppearance.default
        edit.isSecureTextEntry = false
        edit.textAlignment = NSTextAlignment.left
        edit.textColor = UIColor.red
        
        let right = UIButton(type: .infoLight)
        right.imageEdgeInsets.left = -10
        edit.rightView = right
        edit.rightViewMode = .always
        self.view.addSubview(edit)
        
        edit.delegate = self
    }
    @objc func offAndOn(swi: UISwitch) {
        switch swi.isOn {
        case true:
            print("打开")
        default:
            print("关闭")
        }
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text ?? "nothing")
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("准许进入编辑状态")
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("进入编辑状态")
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("结束编辑")
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("已经结束编辑")
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("返回键")
        textField.resignFirstResponder()//注销第一响应来结束编辑
        return true
    }
}
