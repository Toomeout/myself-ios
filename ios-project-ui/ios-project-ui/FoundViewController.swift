//
//  FoundViewController.swift
//  ios-project-ui
//
//  Created by 李喜明 on 2019/9/26.
//  Copyright © 2019 李喜明. All rights reserved.
//

import UIKit

class FoundViewController: UIViewController ,UIScrollViewDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()

        let scroll = UIScrollView(frame: self.view.frame)
        scroll.delegate = self
        self.view.addSubview(scroll)
        
        let subOne = UIView(frame: self.view.frame)
        let subTwo = UIView(frame: CGRect(x: view.frame.width, y: 0, width: view.frame.width, height: view.frame.height))
        
        subOne.backgroundColor = UIColor.red
        subTwo.backgroundColor = UIColor.green
        
        scroll.addSubview(subOne)
        scroll.addSubview(subTwo)
        
        scroll.isScrollEnabled = true
        scroll.contentSize = CGSize(width: UIScreen.main.bounds.width*2, height: UIScreen.main.bounds.height)
        scroll.showsHorizontalScrollIndicator = true
        scroll.showsVerticalScrollIndicator = true
        scroll.indicatorStyle = .white
        scroll.bounces = true
        scroll.scrollsToTop = true
        scroll.isPagingEnabled = true
        scroll.minimumZoomScale = 0.5
        scroll.maximumZoomScale = 2
        scroll.bouncesZoom = true
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("开始拖动offset值发生改变")
    }
}
