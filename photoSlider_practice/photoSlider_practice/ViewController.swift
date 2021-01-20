//
//  ViewController.swift
//  photoSlider_practice
//
//  Created by BigHand on 2021/01/15.
//

import UIKit
import PhotoSlider

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   
    var images : [String] = ["car1","car2","car3","car4","car5"]
    var currentPage: Int = 0
    
    @IBOutlet weak var myPage: UIPageControl!
    
    @IBAction func btn(_ sender: Any) {
        print("AAAA")
        let vc = storyboard?.instantiateViewController(identifier: "SubVC") as? SubVC
        //let vc = storyboard?.instantiateViewController(identifier: "SecondViewController") as? SecondViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

            return images.count
     
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        cell.imageView.image = UIImage(named: images[indexPath.row])
        cell.imageView.contentMode = .scaleAspectFit
        
            return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        myPage.currentPage = 0
        myPage.numberOfPages = images.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        myPage.currentPage = indexPath.row
    }


}
