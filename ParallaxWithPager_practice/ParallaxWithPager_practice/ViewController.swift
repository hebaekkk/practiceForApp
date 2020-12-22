//
//  ViewController.swift
//  ParallaxWithPager_practice
//
//  Created by BigHand on 2020/12/21.
//

import UIKit
import MXParallaxHeader

class ViewController: UIViewController,UIScrollViewDelegate,MXParallaxHeaderDelegate {

    // Scroll bottom View 에 넣는다.
    // 된다면 ScrollView 안에 Paging 넣읍시다.
    let button = UIButton()
    
    @IBOutlet var headerView: UIView!
    
    let bottomView: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .darkGray
        return view
    }()
    ////
    let mainScroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        scroll.isScrollEnabled = true
        scroll.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return scroll
    }()
//    let headerView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//        return view
//    }()
    ////
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

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        scroll.parallaxHeader.minimumHeight = menuView.frame.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBottomBtn()
        
        mainScroll.parallaxHeader.view = headerView
        mainScroll.parallaxHeader.height = 50
        mainScroll.parallaxHeader.mode = .fill
        mainScroll.parallaxHeader.delegate = self

    
        //scroll.delegate = self

        
        view.addSubview(mainScroll)
        mainScroll.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainScroll.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainScroll.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainScroll.bottomAnchor.constraint(equalTo: button.topAnchor).isActive = true
      
        
        mainScroll.addSubview(headerView)
        headerView.leftAnchor.constraint(equalTo: mainScroll.leftAnchor).isActive = true
        headerView.topAnchor.constraint(equalTo: mainScroll.topAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        headerView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        
        mainScroll.addSubview(scroll)
        scroll.leftAnchor.constraint(equalTo: mainScroll.leftAnchor).isActive = true
        scroll.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        scroll.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scroll.bottomAnchor.constraint(equalTo: button.topAnchor, constant: 10).isActive = true
        
        setBottomScroll()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mainScroll.parallaxHeader.minimumHeight = 50
        
    }
    
    func setBottomScroll() {
//        scroll.addSubview(View)
//        View.leftAnchor.constraint(equalTo: scroll.leftAnchor).isActive = true
//        View.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
//        View.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//        View.heightAnchor.constraint(equalToConstant: 350).isActive = true

        
        scroll.addSubview(menuView)
        menuView.leftAnchor.constraint(equalTo: scroll.leftAnchor).isActive = true
        menuView.topAnchor.constraint(equalTo: scroll.topAnchor).isActive = true
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

