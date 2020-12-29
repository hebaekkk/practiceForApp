//
//  ViewController.swift
//  lamp
//
//  Created by BigHand on 2020/10/14.
//

import UIKit

class ViewController: UIViewController {

    var maxImage = 6
    var numImage = 1
    
    var isZoom = false// img확대 여부를 나타내는 bool타입의 변수
    var imgOn: UIImage?//켜진 전구 이미지를 가지고 있는 UIImage 타입의 변수
    var imgOff: UIImage?//꺼진 전구 이미지를 가지고 있는 UIImage 타입의 변수

    
    
    @IBOutlet var imgView: UIImageView!//img View 에 대한 아웃렛 변수
    @IBOutlet var btnResize: UIButton!//버튼에 대한 아웃렛 변수
    @IBOutlet var imgGallery: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imgOn = UIImage(named: "lamp_On.png")//imgOn에 "lamp_On.png"를 할당
        imgOff = UIImage(named: "lamp_Off.png")//imgOff에 "lamp_Off.png"를 할당
        //imgStar = UIImage(named: "star.png")
        
        imgView.image = imgOn//위에서 할당한 imgOn 이미지를 imgView에 할당
        imgGallery.image = UIImage(named: "1.png")
        
    }
    //확대 축소 버튼에 대한 액션 함수
    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat = 2.0// 확대할 배율값
        var newWidth : CGFloat, newHeight: CGFloat//확대할 크기의 계산값을 보관할 변수
        
        if(isZoom){//true 현재 확대된 그림일 경우( 타이틀은 축소 )
            //이미지 뷰의 프레임 너빗값을 scale로 나눔
            newWidth = imgView.frame.width/scale
            //이미지 뷰의 프래임 높이값을 scale로 나눔
            newHeight = imgView.frame.height/scale
            //버튼의 타이틀을 "확대"로 변경합니다.
            btnResize.setTitle("확대", for: .normal)
        
        } else{
            //false 현재 축소된 그림일 경우
            //이미지 뷰의 프레임 너비값에 스케일을 곱함
            newWidth = imgView.frame.width*scale
            //이미지 뷰의 프레임 높이값에 스케일을 곱함
            newHeight = imgView.frame.height*scale
            //버튼의 타이틀을 "축소"로 변경합니다.
            btnResize.setTitle("축소", for: .normal)
        }
        //이미지 뷰의 프레임 크기를 수정된 너비와 높이로 변경합니다.
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        
        isZoom = !isZoom//isZoom의 상태를 !연산자를 사용하여 반전시킵니다.
        
    }
    //On Off 스위치에 대한 액션함수
    @IBAction func switchImageOnOff (_ sender: UISwitch) {
        if sender.isOn {//만일 스위치가 On이면
            imgView.image = imgOn//imgView의 이미지에 imgOn이미지를 할당
        } else {//만일 스위치가 Off이면
            imgView.image = imgOff//imgView의 이미지에 imgOff이미지를 할당.
        }
    }
    
    @IBAction func btnPrevImage (_ sender: UIButton){
        numImage = numImage - 1
        if (numImage < 1) {
            numImage = maxImage
        }
        
        let imageName = String(numImage) + ".png"
        imgGallery.image = UIImage(named: imageName)
    }
    
    @IBAction func btnNextImage (_ sender: UIButton){
        numImage = numImage + 1
        if (numImage > maxImage ) {
            numImage = 1
        }
        
        let imageName = String(numImage) + ".png"
        imgGallery.image = UIImage(named: imageName)
    }
    
}

