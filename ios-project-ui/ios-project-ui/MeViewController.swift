//
//  MeViewController.swift
//  ios-project-ui
//
//  Created by 李喜明 on 2019/9/26.
//  Copyright © 2019 李喜明. All rights reserved.
//

import UIKit

class MeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var dataCells = [String: [String: String]]()
    var keys = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let table = UITableView(frame: self.view.frame, style: .plain)
        table.delegate = self
        table.dataSource = self
        
        self.view.backgroundColor = UIColor.gray
        
        dataCells = [
            "A": ["name":"王小明","sex":"男","icon":"me.jpg","birthday":"2017-10-11"],
            "B": ["name":"李磊","sex":"男","icon":"me.jpg","birthday":"2011-12-30"],
            "C": ["name":"韩梅","sex":"女","icon":"me.jpg","birthday":"2014-9-10"],
            "D": ["name":"JIM","sex":"男","icon":"me.jpg","birthday":"2008-10-1"]]
        
        keys = dataCells.keys.sorted()
        
        view.addSubview(table)
    }
    //MARK:UITableViewDataSource 代理方法
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  1 //返回每个章节cell条数1dataCells[keys[section]]?.count ??
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //渲染每条cell
        let cellid = "cellid"
        var cell: MyViewCell? = tableView.dequeueReusableCell(withIdentifier: cellid) as? MyViewCell//复用cell 从队列中取出重复使用
        if cell == nil {
            cell = MyViewCell(style: .subtitle, reuseIdentifier: cellid)
        }
        //z设置cell的属性
        let dic = dataCells[keys[indexPath.section]]
        cell?.userLabel.text = dic?["name"]
        cell?.sexLabel.text = dic?["sex"]
        cell?.iconImv.image = UIImage(named: ((dic?["icon"] ?? "me.jpg")))
        cell?.birthdayLabel.text = dic?["birthday"]
        //cell?.textLabel?.text = dic?["name"]
        return cell!
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return keys.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return keys[section] //设置指定章节的标题文字，如果不设置或代理返回值为nil，不显示
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true //设置是否能编辑
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("当完成删除和插入的时候调用")
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true//设置是否能拖动
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("移动\(sourceIndexPath)-->\(destinationIndexPath)")
    }
    //MARK:UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0//定义cell的行高
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("选中\(indexPath)")
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("即将显示时候调用")
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("\(indexPath)点击了已经被选中的cell")
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return keys//返回索引内容
    }
}
