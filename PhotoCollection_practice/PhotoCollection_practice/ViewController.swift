//
//  ViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/26.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
    
    let button: UIButton = {
        let button = UIButton()
        //button.setTitle("ImageSlider Prac", for: .normal)
        button.setTitle("FOLDING COLLECTIONVIEW", for: .normal)
        button.backgroundColor = .black
        return button
    }()

    @IBAction func myDyColl(_ sender: Any) {
        let vc = MyDyCollVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func dynamicTable(_ sender: Any) {
        let vc = DynamicTableVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func delegatePractice(_ sender: Any) {
        let vc = dVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    @IBAction func photoCollectionButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "EditPhotoViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func moveToMyCollectionBtn(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "MyPhotoCollectionViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func moveToBasic(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "BringImagePracticeViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func moveToBasicCollection(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "BasicCollectionViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func moveTobottomPopupView(_ sender: Any) {
        //BottomPopupViewController
        let vc = storyboard?.instantiateViewController(identifier: "BottomPopupViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func moveToDynamic(_ sender: Any) {

        let vc = storyboard?.instantiateViewController(identifier: "DynamicHeightViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    @IBAction func moveTojson(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "CommViewController")
        navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        // Do any additional setup after loading the view.
        view.addSubview(button)
        button.snp.makeConstraints{ make in
            make.top.equalTo(self.view).offset(150)
            make.trailing.equalTo(self.view).offset(-10)
            make.height.equalTo(30)
            //make.width.equalTo(60)
        }
        button.addTarget(self, action: #selector(moveToImageSlider(_:)), for: .touchUpInside)
    }
    
    @objc func moveToImageSlider(_ sender: UIButton) {
        //let vc = ImageSliderVC()
        let vc = NEW()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }


}

