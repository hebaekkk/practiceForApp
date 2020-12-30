//
//  ContentCell.swift
//  ExpandableTableView
//
//  Created by Pratik Lad on 29/12/17.
//  Copyright © 2017 Pratik Lad. All rights reserved.
//

import UIKit

class ContentCell: UITableViewCell{
    
    @IBOutlet weak var UIView: UIView!
    
    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        UIView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
    }
    
    //Cell의 overlap막기 위해서 쓰는 함수이다.
    //1단계 for문은 덮어씌운 UIView 밑에 있는 Row행.
    //2단계 for문은
    override func prepareForReuse() {
        super.prepareForReuse()
        for view in self.UIView.subviews {
            print("view : \(view)")
            for v in view.subviews {
                print("\(v)")
                v.removeFromSuperview()
            }
        }
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
//        let TscsBtn = DynamicButtonStack(buttons: [
//                                    makeButton("집쓰레기배출/청소"),
//                                    makeButton("유품정리/고독사"),
//                                    makeButton("사고현장정리"),
//                                    makeButton("침수/수해복구청소")])
//
//        let TscsBtn1 = DynamicButtonStack(buttons: [
//                                    makeButton("이사 후 퇴실청소"),
//                                    makeButton("화재현장 청소"),
//                                    makeButton("빈집만들기"),
//                                    makeButton("기타 특수청소")])
//
//        let JrsnBtn = DynamicButtonStack(buttons: [
//            makeButton("집 전체"),
//            makeButton("드레스룸/옷방(의류)"),
//            makeButton("거실"),
//            makeButton("방2개"),
//            makeButton("이삿짐 정리")
//        ])
//
//        let JrsnBtn1 = DynamicButtonStack(buttons: [
//            makeButton("주방"),
//            makeButton("베란다/다용도실"),
//            makeButton("방 1개"),
//            makeButton("방 3개"),
//            makeButton("상담 후 결정")
//        ])
//
//        let PgmBtn = DynamicButtonStack(buttons: [
//            makeButton("생활폐기물"),
//            makeButton("건축폐기물"),
//            makeButton("혼합폐기물"),
//            makeButton("고철/재활용")
//
//        ])
//
//        let PgmBtn1 = DynamicButtonStack(buttons: [
//            makeButton("사업장폐기물"),
//            makeButton("인테리어 폐기물"),
//            makeButton("목재(MDF)"),
//            makeButton("가구/가전제품")
//        ])
//
//        let CgBtn = DynamicButtonStack(buttons: [
//            makeButton("주택(주거공간)"),
//            makeButton("학원/독서실/PC방"),
//            makeButton("식당/공유주방"),
//            makeButton("유흥주점/노래방"),
//            makeButton("병원/의원/약국")
//        ])
//
//        let CgBtn1 = DynamicButtonStack(buttons: [
//            makeButton("사무실"),
//            makeButton("상가"),
//            makeButton("카페/제과점"),
//            makeButton("뷰티/마사지샵"),////?
//            makeButton("건물/외부 구조물")//?폐기물이랑 중복아님?
//        ])
