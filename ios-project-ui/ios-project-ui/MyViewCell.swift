//
//  MyViewCell.swift
//  ios-project-ui
//
//  Created by 李喜明 on 2019/9/28.
//  Copyright © 2019 李喜明. All rights reserved.
//

import UIKit

class MyViewCell: UITableViewCell {
    
    let width = UIScreen.main.bounds.width
    var userLabel: UILabel!
    var sexLabel: UILabel!
    var birthdayLabel: UILabel!
    var iconImv: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        userLabel = UILabel(frame:CGRect(x: 74, y: 18, width: 70, height: 15))
        userLabel.textColor = UIColor.gray
        userLabel.font = UIFont.systemFont(ofSize: 15)
        userLabel.textAlignment = .left
        
        iconImv = UIImageView(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        iconImv.layer.masksToBounds = true
        iconImv.layer.cornerRadius = 22.0
        
        // 性别
        sexLabel = UILabel(frame: CGRect(x: 150, y: 20, width: 50, height: 13))
        sexLabel.textColor = UIColor.black
        sexLabel.font = UIFont.systemFont(ofSize: 13)
        sexLabel.textAlignment = .left
        
        // 出生日期
        birthdayLabel = UILabel(frame: CGRect(x: 74, y: 49, width: width-94, height: 13))
        birthdayLabel.textColor = UIColor.gray
        birthdayLabel.font = UIFont.systemFont(ofSize: 13)
        birthdayLabel.textAlignment = .left
        
        contentView.addSubview(iconImv)
        contentView.addSubview(userLabel)
        contentView.addSubview(sexLabel)
        contentView.addSubview(birthdayLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
