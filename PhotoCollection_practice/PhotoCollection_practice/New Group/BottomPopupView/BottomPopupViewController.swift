//
//  BottomPopupViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/01.
//

import UIKit
import PanModal

class BottomPopupViewController: UIViewController {

    @IBAction func button(_ sender: Any) {
        
        
        let vc = BasicModalViewController()
//        self.present(vc, animated: true, completion: {
//
//            vc.presentationController?.presentedView?.gestureRecognizers?[0].isEnabled = false
//
//        })
        presentPanModal(vc)
        
        
        
    
        
        if(isBottomSheetShown) {
            UIView.animate(withDuration: 0.5, animations: {
                self.heightConstraint.constant = 0
                self.view.layoutIfNeeded()
            }) {(status) in
                self.isBottomSheetShown = false
                
            }
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.heightConstraint.constant = 200
                self.view.layoutIfNeeded()
            }) {(status) in
                //completion code
                self.isBottomSheetShown = true
            }
            
        }
    }

    @IBOutlet weak var btm: UIButton!
    @IBOutlet weak var btmHeightConstraint: NSLayoutConstraint!
    

    @IBOutlet weak var bottomButton: UIButton!
    @IBAction func bottomButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.sendSubviewToBack(self.btm)
            self.bottomButton.isHidden = false
            self.heightConstraint.constant = 200
            self.bottomViewButtonHeightConstraint.constant = 60
            self.isBottomSheetShown = true
            self.view.layoutIfNeeded()
        }) {(status) in
            //completion code
            //self.isBottomSheetShown = true
        }
        print("\(isBottomSheetShown)")
    }
    
    @IBAction func bottomViewButton(_ sender: Any) {
        UIView.animate(withDuration: 0.5, animations: {
            self.heightConstraint.constant = 0
            self.bottomViewButtonHeightConstraint.constant = 0
            self.bottomButton.isHidden = true
            self.isBottomSheetShown = false
            
            self.btm.heightAnchor.constraint(equalToConstant: 60).isActive = true
            self.view.layoutIfNeeded()
        }) {(status) in
            self.isBottomSheetShown = false
            
        }
        print("\(isBottomSheetShown)")
    }

    
    @IBOutlet weak var bottomViewButtonHeightConstraint: NSLayoutConstraint!
    
    private var isBottomSheetShown = false
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
 
    //let popupController = STPo
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        view.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      view.endEditing(true)
    }


}
