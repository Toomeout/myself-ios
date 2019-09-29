//
//  SecondViewController.swift
//  ios-project-ui
//
//  Created by 李喜明 on 2019/9/26.
//  Copyright © 2019 李喜明. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UIScrollViewDelegate {

    let pageControl = UIPageControl()
    let scrollView  = UIScrollView()
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "第二页"
        
        
        
        view.backgroundColor = UIColor.cyan
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        scrollView.frame = view.bounds
        view.addSubview(scrollView)
        // 设置是否翻页
        scrollView.isPagingEnabled = true
        // 可以滚动的区域
        scrollView.contentSize = CGSize(width: screenWidth*9, height: screenHeight)
        // 显⽰示⽔水平滚动条
        scrollView.showsHorizontalScrollIndicator = true
        // 显⽰示垂直滚动条
        scrollView.showsVerticalScrollIndicator = true
        // 滚动条样式
        scrollView.indicatorStyle = UIScrollView.IndicatorStyle.white
        // 设置回弹效果
        scrollView.bounces = true
        // 设置scrollView可以滚动
        scrollView.isScrollEnabled = true
        // 当scrollsToTop=true时，点击设备状态栏会自动滚动到顶部
        scrollView.scrollsToTop = true
        // 缩放的最小比例
        scrollView.minimumZoomScale = 0.5
        // 放大的最大比例
        scrollView.maximumZoomScale = 2.0
        // 缩放回弹
        scrollView.bouncesZoom = true
        // 代理
        scrollView.delegate = self
        
        for i in 1..<10 {
            let imageView = UIImageView(frame: CGRect(x: screenWidth*CGFloat(i-1), y: 0, width: screenWidth, height: screenHeight))
            imageView.image = UIImage(named: "me.jpg")
            scrollView.addSubview(imageView)
        }
        
        // 页码控制器
        //pageControl.frame = CGRect(x: 0, y: screenHeight-50, width: screenWidth, height: 50)
        //pageControl.backgroundColor = UIColor.gray
        // 总共有多少页
       // pageControl.numberOfPages = 9
        // 当前页码
        //pageControl.currentPage = 0
        // 添加点击事件
        //pageControl.addTarget(self, action: #selector(pageControlClick), for: .valueChanged)
        //view.addSubview(pageControl)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(threePage))
        
    }
    
    @objc func threePage() {
        navigationController?.pushViewController(ThreeViewController(), animated: true)
    }
    //MARK: pageControl点击调用方法
    @objc func pageControlClick(pageControl:UIPageControl) {
        UIView.animate(withDuration: 0.3) {
            self.scrollView.contentOffset = CGPoint(x: CGFloat(pageControl.currentPage)*self.scrollView.frame.size.width, y: 0)
        }
    }
    
    //MARK: UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrollView滚动时调用，只要offset的值发生变化就调用")
        
        // 函数floor的作用是返回比小的整数，比如floor(1.2312) = 1
        let page = floor((scrollView.contentOffset.x)/scrollView.frame.size.width)
        pageControl.currentPage = Int(page)
        
    }
    
    func scrollViewWillBeginZooming(_ scrollView: UIScrollView, with view: UIView?) {
        print("当将要开始缩放时，执行该方法。一次有效缩放就只执行一次。")
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print("当scrollView缩放时，调用该方法。在缩放过程中，会多次调用")
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        print("当缩放结束后，并且缩放大小回到minimumZoomScale与maximumZoomScale之间后（我们也许会超出缩放范围），调用该方法。")
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        print("返回将要缩放的UIView对象。要执行多次")
        return scrollView.subviews.first
    }
    
    func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
        print("指示当用户点击状态栏后，滚动视图是否能够滚动到顶部。")// 需要设置滚动视图的属性：scrollView.scrollsToTop=true
        return true
    }
    
    func scrollViewDidScrollToTop(_ scrollView: UIScrollView) {
        print("当滚动视图滚动到最顶端后，执行该方法")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("当开始滚动视图时，执行该方法。一次有效滑动只执行一次。")
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        print("滑动视图，当手指离开屏幕那一霎那，调用该方法。一次有效滑动只执行一次。")
    }
    
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        print("滑动减速时调用该方法。")
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("滚动视图减速完成，滚动将停止时，调用该方法。一次有效滑动只执行一次。")
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        print("当滚动视图动画完成后，调用该方法，如果没有动画，那么该方法将不被调用")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("滑动scrollView，并且手指离开时执行。一次有效滑动只执行一次。") //当pagingEnabled属性为true时，不调用该方法
    }
}
