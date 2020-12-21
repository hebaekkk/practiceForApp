//
//  ViewController.swift
//  ParallaxWithPager_practice
//
//  Created by BigHand on 2020/12/21.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    let button = UIButton()

    
    let scroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        return scroll
    }()
    let View: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.5656828704, green: 0.4490451389, blue: 0.9195601852, alpha: 1)
        return view
    }()
    
    let menuView: UIView = {
        let view = UIView()
        let lable = UILabel()
        view.addSubview(lable)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "FiX !!!"
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.6748842593, green: 0.6788483796, blue: 1, alpha: 1)
        let table = UITableView()
        view.addSubview(table)
        
        return view
    }()
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    var oldContentOffset = CGPoint.zero

    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let topViewTopConstraint = View.constraints.first!
//        //ScrollView's contentOffset differences with previous contentOffset
//        let contentOffset = scrollView.contentOffset.y - oldContentOffset.y
//        //print("content: \(contentOffset), sv: \(scrollView.contentOffset.y), oc:\(oldContentOffset.y)")
//        // Scrolls UP - we compress the top view
//        if contentOffset > 0 && scrollView.contentOffset.y > 0 {
//            if ( topViewTopConstraint.constant > -50 ) {// 남아있는 뷰의 크기 !! Scroll up 했을 때!!!
//                topViewTopConstraint.constant -= contentOffset
//                scrollView.contentOffset.y -= contentOffset
//            }
//        }
//
//        // Scrolls Down - we expand the top view
//        if contentOffset < 0 && scrollView.contentOffset.y < 0 {
//            if (topViewTopConstraint.constant < 0) {
//                if topViewTopConstraint.constant - contentOffset > 0 {
//                    topViewTopConstraint.constant = 0
//                } else {
//                    topViewTopConstraint.constant -= contentOffset
//                }
//                scrollView.contentOffset.y -= contentOffset
//            }
//        }
//        oldContentOffset = scrollView.contentOffset
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBottomBtn()
    
        scroll.delegate = self

        
        view.addSubview(scroll)
        scroll.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scroll.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scroll.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: button.topAnchor).isActive = true
        
        scroll.addSubview(View)
        View.leftAnchor.constraint(equalTo: scroll.leftAnchor).isActive = true
        View.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
        View.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        View.heightAnchor.constraint(equalToConstant: 350).isActive = true

        
        scroll.addSubview(menuView)
        menuView.leftAnchor.constraint(equalTo: scroll.leftAnchor).isActive = true
        menuView.topAnchor.constraint(equalTo: View.bottomAnchor).isActive = true
        menuView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        menuView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        //lastView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        
        scroll.addSubview(contentView)
        contentView.leftAnchor.constraint(equalTo: scroll.leftAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: menuView.bottomAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: 700).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor).isActive = true
        
    }
    func setBottomBtn() {
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("HAHA!", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        button.heightAnchor.constraint(equalToConstant: 60).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        button.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    }

}

