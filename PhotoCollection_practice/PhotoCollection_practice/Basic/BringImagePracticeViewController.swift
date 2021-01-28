//
//  BasicCollectionViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/01/28.
//

import UIKit

class BringImagePracticeViewController: UIViewController {

    
    var imageView = UIImageView()
    var button = UIButton(type: .system)
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "BASIC"

        // 기본 imageView의 배경색과 크기 설정
        self.imageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 500)
        self.imageView.backgroundColor = .gray
        
        // 버튼의 크기와 title을 설정하고 버튼을 누르면 pickImage 함수가 호출된다.
        self.button.frame = CGRect(x: 0, y: 510, width: UIScreen.main.bounds.size.width, height: 50)
        self.button.setTitle("이미지 선택", for: .normal)
        self.button.titleLabel?.textAlignment = .center
        self.button.addTarget(self, action: #selector(self.pickImage), for: .touchUpInside)
        
        self.view.addSubview(self.imageView)
        self.view.addSubview(self.button)
        
        self.picker.sourceType = .photoLibrary // 방식 선택. 앨범에서 가져오는걸로 선택.
        self.picker.allowsEditing = false // 수정가능하게 할지 선택. 하지만 false
        self.picker.delegate = self // picker delegate
    }
    
    @objc func pickImage() {
        print("picker Clicked")
        self.present(self.picker, animated: true) // Controller이기 때문에 present 메서드를 이용해서 컨트롤러 뷰를 띄워준다!
    }


}

extension BringImagePracticeViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        var newImage: UIImage? = nil
        print("0")
        if let possibleImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage { // 수정된 이미지가 있을 경우
            print("1")
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage { // 오리지널 이미지가 있을 경우
            print("2")
            newImage = possibleImage
        }


        self.imageView.image = newImage // 받아온 이미지를 이미지 뷰에 넣어준다.
        //self.imageView.image = newImage
        print("NEW IMAGE : \(String(describing: newImage))")
        picker.dismiss(animated: true) // 그리고 picker를 닫아준다.
    }
    
}
