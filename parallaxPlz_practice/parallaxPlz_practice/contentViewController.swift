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
        
    
        menuVC.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
        menuVC?.registerFocusView(nib: UINib(nibName: "FocusView", bundle: nil))
        
        menuVC.reloadData()
        contentVC.reloadData()
        
        //dataSource = makeDataSource()
        
        
    }
    
    //[  ]UIColor를 VC로? 어디 쓰는 코드인가...
    static var viewController: (UIColor) -> UIViewController = { (color) in
       let vc = UIViewController()
        vc.view.backgroundColor = color
        return vc
    }
    
    var dataSource = [(menuTitle: "업체정보", vc: viewController(.red)), (menuTitle: "후기", vc: viewController(.blue))]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuVC = vc
            menuVC.dataSource = self // <- set menu data source
        } else if let vc = segue.destination as? PagingContentViewController {
            contentVC = vc
            contentVC.dataSource = self
        }
    }
    
//    var dataSource = [(menu: String, content: UIViewController)]() {
//        didSet {
//            menuVC.reloadData()
//            contentVC.reloadData()
//        }
//    }
    
    lazy var firstLoad: (() -> Void)? = { [weak self, menuVC, contentVC] in
        menuVC?.reloadData()
        contentVC?.reloadData()
        self?.firstLoad = nil
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let vc = segue.destination as? PagingMenuViewController {
//            menuVC = vc
//            menuVC.dataSource = self // set menu DataSource
//            menuVC.delegate = self
//        } else if let vc = segue.destination as? PagingContentViewController {
//            contentVC = vc
//            //contentVC.delegate = self
//            //contentVC.delegate = self
//
//
//        }
//    }
//
    
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
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return UIScreen.main.bounds.width / CGFloat(dataSource.count)
 
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        cell.titleLabel.text = dataSource[index].menuTitle
        return cell
    }
}
extension contentViewController: PagingContentViewControllerDataSource {
    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
        return dataSource.count
    }
    
    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
        return dataSource[index].vc
    }
}

/////
//extension contentViewController: PagingMenuViewControllerDataSource {
//    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
//        return dataSource.count
//    }
//
//    //Menu Cell Width Determined
//    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
//        let screenWidth = UIScreen.main.bounds.width
//        return screenWidth / 2 //CGFloat(dataSource.count)
//    }
//
//    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
//        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuVell", for: index) as! MenuCell
//
//        cell.titleLabel.text = dataSource[index].menu
//        cell.titleLabel.textColor = .gray
//        return cell
//    }
//
//}
////메뉴 컨트롤 델리겟
//extension contentViewController: PagingMenuViewControllerDelegate {
//    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
//        contentVC.scroll(to: page, animated: true)
//    }
//}
////컨텐트 데이터 소스
//extension contentViewController: PagingContentViewControllerDataSource {
//    func numberOfItemsForContentViewController(viewController: PagingContentViewController) -> Int {
//        return dataSource.count
//    }
//
//    func contentViewController(viewController: PagingContentViewController, viewControllerAt index: Int) -> UIViewController {
//        dataSource[index].content
//    }
//}
//extension contentViewController: PagingContentViewControllerDelegate {
//    func contentViewController(viewController: PagingContentViewController, didManualScrollOn index: Int, percent: CGFloat) {
//        menuVC.scroll(index: index,percent: percent, animated: false)
//    }
//}
