//
//  ViewController.swift
//  parallelEffect_practice
//
//  Created by BigHand on 2020/12/16.
//

import UIKit
//parallax
class ViewController: UIViewController {

    @IBOutlet weak var topViewTopConstraint: NSLayoutConstraint!
    @IBOutlet var topView: UIView!
    
    var oldContentOffset = CGPoint.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //ScrollView's contentOffset differences with previous contentOffset
        let contentOffset = scrollView.contentOffset.y - oldContentOffset.y
        //print("content: \(contentOffset), sv: \(scrollView.contentOffset.y), oc:\(oldContentOffset.y)")
        // Scrolls UP - we compress the top view
        if contentOffset > 0 && scrollView.contentOffset.y > 0 {
            if ( topViewTopConstraint.constant > -50 ) {// 남아있는 뷰의 크기 !! Scroll up 했을 때!!!
                topViewTopConstraint.constant -= contentOffset
                scrollView.contentOffset.y -= contentOffset
            }
        }
        
        // Scrolls Down - we expand the top view
        if contentOffset < 0 && scrollView.contentOffset.y < 0 {
            if (topViewTopConstraint.constant < 0) {
                if topViewTopConstraint.constant - contentOffset > 0 {
                    topViewTopConstraint.constant = 0
                } else {
                    topViewTopConstraint.constant -= contentOffset
                }
                scrollView.contentOffset.y -= contentOffset
            }
        }
        oldContentOffset = scrollView.contentOffset
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
        return cell
    }
}

