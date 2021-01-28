//
//  BasicCollectionViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/28.
//

import UIKit

class BasicCollectionViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    //사진 저장할곳
    var photoSelectedPostContents : [PostContent]?
   
    @IBAction func check(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        //if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera){
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = false
            imagePicker.delegate = self
            //DispatchQueue.main.async {
            self.present(imagePicker, animated: true, completion: nil)
            //}
        //}
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}


