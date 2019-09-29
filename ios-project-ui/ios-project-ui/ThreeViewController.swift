//
//  ThreeViewController.swift
//  ios-project-ui
//
//  Created by 李喜明 on 2019/9/28.
//  Copyright © 2019 李喜明. All rights reserved.
//
import UIKit

class ThreeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var data = [[[String: String]]]()
    var keys = [String]()
    var tabel: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        data = [[["微信支付": "selected"], ["支付宝支付": "no"], ["网银支付": "no"]],
                [["易用支付": "no"], ["小米支付": "no"], ["天意支付": "no"]]]
        tabel = UITableView(frame: self.view.frame)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addOrDelete))
        tabel = UITableView(frame: self.view.frame)
        tabel.delegate = self
        tabel.dataSource = self
        
        self.view.addSubview(tabel)
    }
    @objc func addOrDelete() {
        tabel.setEditing(!tabel.isEditing, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "支付方式"
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.section == 0 {
            return .delete
        } else{
            return .insert
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let item = data[indexPath.section][indexPath.row]
        if editingStyle == .insert {
            data[0].insert(item, at: data[0].count)
            data[1].remove(at: indexPath.row)
            //tableView.deleteRows(at: [indexPath], with: .left)
            print("增加了支付方式")
        } else {
            data[1].insert(item, at: data[1].count)
            data[0].remove(at: indexPath.row)
            
            //tableView.deleteRows(at: [indexPath], with: .left)
            print("删除了支付方式")
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "cellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellId)
            cell?.selectionStyle = .none
        }
        let dic = data[indexPath.section][indexPath.row]
        cell?.textLabel?.text = dic.keys.first
        if  dic.values.first == "selected" {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.section == 0 else {
            return
        }
        var i = 0
        for item in data[indexPath.section] {
            var item = item as Dictionary
            if i == indexPath.row {
                item[item.keys.first!] = "selected"
            } else {
                item[item.keys.first!] = "no"
            }
            data[indexPath.section][i] = item
            i = i + 1
        }
        tableView.reloadData()
        print("选择了\(indexPath)")
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = data[sourceIndexPath.section][sourceIndexPath.row]
        data[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        data[sourceIndexPath.section].insert(item, at: destinationIndexPath.row)
        
    }
}
