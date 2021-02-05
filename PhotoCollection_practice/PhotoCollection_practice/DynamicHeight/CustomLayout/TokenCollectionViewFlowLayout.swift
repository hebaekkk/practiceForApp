//
//  TokenCollectionViewFlowLayout.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/02.
//

import UIKit
/* FLOWLAYOUT
 UICollectionViewFlowLayout 클래스를 사용하면 컬렉션뷰의 셀을 원하는 형태로 정렬할 수 있습니다. 플로우 레이아웃은 레이아웃 객체가 셀을 선형 경로에 배치하고 최대한 이 행을 따라 많은 셀을 채우는것을 의미합니다. 현재 행에서 레이아웃 객체의 공간이 부족하면 새로운 행을 생성하고 거기에서 레이아웃 프로세스를 계속 진행합니다.
 */
class TokenCollectionViewFlowLayout: UICollectionViewFlowLayout {
//    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
//        //이 메소드는 주어진 사각형 내에 있는 모든 아이템들을 위한 레이아웃 속성을 반환해야 합니다.
//        let attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
//        /*layoutAttributesForItem(at:) : 요구한 레이아웃 정보를 collection view로(에) 제공합니다.
//          이것을 반드시 재정의 해야하고 요청된 indexPath에 아이템에 대한 레이아웃 속성을 반환 해야 합니다.
//         */
//        var newAttributesForElementInRect = [UICollectionViewLayoutAttributes]()
//
//        var leftMargin: CGFloat = self.sectionInset.left //sectionInset : The margins used to lay out content in a section.
//
//        for attributes in attributesForElementsInRect! {
//
//            if(attributes.frame.origin.x == self.sectionInset.left) {
//                leftMargin = self.sectionInset.left // 셀 ? 이 CollectionView 왼쪽 마진일 경우.
//            } else { // 그렇지 않으면
//                var newLeftAlignedFrame = attributes.frame //새로운 왼쪽프레임을 설정
//
//                if leftMargin + attributes.frame.width < self.collectionViewContentSize.width {
//                    //왼쪽 마진 + 프레임(셀의 폭)을 더한게 콜렉션뷰 폭보다 작다면
//                    newLeftAlignedFrame.origin.x = leftMargin
//                    //새로운왼쪽 프레임의 originX는 왼쪽 마진 입니다.
//                } else {
//                    newLeftAlignedFrame.origin.x = self.sectionInset.left
//                    //넘어간다면 새로운 origin x 는 collectionview의 왼쪽입니다.
//                }
//
//                attributes.frame = newLeftAlignedFrame
//
//            }
//
//            leftMargin += attributes.frame.size.width + 8
//            //Spacing 8 주고 frame 폭 더한게 왼쪽 마진이군
//
//            newAttributesForElementInRect.append(attributes)
//            //새로운 Rect Attributes에 attributes를 추가한다
//        }
//      return newAttributesForElementInRect
//
//
//    }
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
      let attributesForElementsInRect = super.layoutAttributesForElements(in: rect)
      var newAttributesForElementsInRect = [UICollectionViewLayoutAttributes]()
      
      var leftMargin: CGFloat = self.sectionInset.left
      
      for attributes in attributesForElementsInRect! {
        if (attributes.frame.origin.x == self.sectionInset.left) {
          leftMargin = self.sectionInset.left
        } else {
          var newLeftAlignedFrame = attributes.frame
          
          if leftMargin + attributes.frame.width < self.collectionViewContentSize.width {
            newLeftAlignedFrame.origin.x = leftMargin
          } else {
            newLeftAlignedFrame.origin.x = self.sectionInset.left
          }
          
          attributes.frame = newLeftAlignedFrame
        }
        leftMargin += attributes.frame.size.width + 8
        newAttributesForElementsInRect.append(attributes)
      }
      
      return newAttributesForElementsInRect
    }
    
    
}
