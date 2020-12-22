//
//  contentViewController.swift
//  parallaxPlz_practice
//
//  Created by BigHand on 2020/12/22.
//

import UIKit
import MXParallaxHeader
import PagingKit

class contentViewController: UIViewController, MXParallaxHeaderDelegate {
    
    var menuVC: PagingMenuViewController!
    var contentVC: PagingContentViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //menuVC?.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        //menuVC?.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        
        //dataSource = makeDataSource()
        
        
    }
    
    var dataSource = [(menu: String, content: UIViewController)]() {
        didSet {
            menuVC.reloadData()
            contentVC.reloadData()
        }
    }
    
    lazy var firstLoad: (() -> Void)? = { [weak self, menuVC, contentVC] in
        menuVC?.reloadData()
        contentVC?.reloadData()
        self?.firstLoad = nil
    }
    
    fileprivate func makeDataSource() -> [(menu: String, content: UIViewController)] {
        let menuArray = ["왼쪽", "오른쪽"]
        return menuArray.map{
            let title = $0
            switch title {
            case "왼쪽":
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "leftViewController") as! leftViewController
                return (menu: title, content: vc)
            case "오른쪽":
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "rightViewController") as! rightViewController
                return (menu: title, content: vc)
            default:
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "leftViewController") as! leftViewController
                return (menu: title, content: vc)
                
            }
        }
    }

}
extension contentViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    //Menu Cell Width Determined
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        let screenWidth = UIScreen.main.bounds.width
        return screenWidth / CGFloat(dataSource.count)
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuVell", for: index) as! MenuCell
        
        cell.titleLabel.text = dataSource[index].menu
        cell.titleLabel.textColor = .gray
        return cell
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].content
    }
}
//메뉴 컨트롤 델리겟
extension contentViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
        contentVC.scroll(to: page, animated: true)
    }
    
    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
        //내용이 스크롤 되면 메뉴를 스크롤 한다.
        menuVC.scroll(index: index, percent: percent, animated: false)
    }
    
}
//컨텐트 데이타 소스
