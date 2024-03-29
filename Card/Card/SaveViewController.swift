//
//  SaveViewController.swift
//  Card
//
//  Created by BigHand on 2021/01/19.
//
//import UIKit
//import MaterialComponents.MaterialButtons_ButtonThemer
//import MaterialComponents.MaterialContainerScheme
//import MaterialComponents.MaterialCards_Theming
//import MaterialComponents.MaterialButtons_Theming
//
//class ViewController: UIViewController {
//
//    let card: CustomCard = CustomCard()
//
//    let containerScheme = MDCContainerScheme()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setUpCard()
//        
//        card.frame = CGRect(x: 30, y: 200, width: view.frame.width - 48, height: 200)
//        card.title.text = "Title"
//        card.applyTheme(withScheme: containerScheme)
//        card.applyOutlinedTheme(withScheme: containerScheme)
//        
//        view.addSubview(card)
//    }
//    
//    func setUpCard() {
//      //let bundle = Bundle(for: CardWithImageViewAndButtonsExample.self)
//      card.cardButton1.setTitle("Action 1", for: .normal)
//      card.cardButton2.setTitle("Action 2", for: .normal)
//      card.cardButton1.applyTextTheme(withScheme: containerScheme)
//      card.cardButton2.applyTextTheme(withScheme: containerScheme)
//      card.cornerRadius = 8
//      card.applyTheme(withScheme: containerScheme)
//      card.setNeedsLayout()
//      card.layoutIfNeeded()
//      card.frame = CGRect(x: card.frame.minX,
//                          y: card.frame.minY,
//                          width: card.intrinsicContentSize.width,
//                          height: card.intrinsicContentSize.height)
//      if card.superview == nil { view.addSubview(card) }
//      card.center = view.center
//    }
//    
//
//
//}
//class CustomCard: MDCCard {
//  
//    static let cardWidth: CGFloat = 200
//  //let imageView: UIImageView = UIImageView()
//    
//    let cardButton1: MDCButton = MDCButton()
//    let cardButton2: MDCButton = MDCButton()
//    let title: UILabel = UILabel()
//
//  override func layoutSubviews() {
//    super.layoutSubviews()
//    //if imageView.superview == nil { addSubview(imageView) }
//    if title.superview == nil {addSubview(title)}
//    if cardButton1.superview == nil { addSubview(cardButton1) }
//    if cardButton2.superview == nil { addSubview(cardButton2) }
//    cardButton1.sizeToFit()
//    cardButton2.sizeToFit()
////    imageView.frame = CGRect(x: 0,
////                             y: 0,
////                             width: CustomCard.cardWidth,
////                             height: 200)
//    title.frame = CGRect(x: 0,
//                         y: 0,
//                         width: CustomCard.cardWidth,
//                         height: 30)
//    cardButton1.frame = CGRect(x: 0,
//                               y: title.frame.maxY,//imageView.frame.maxY + 8,
//                               width: cardButton1.frame.width,
//                               height: cardButton1.frame.height)
//    cardButton2.frame = CGRect(x: 0,
//                               y: cardButton1.frame.maxY + 8,
//                               width: cardButton2.frame.width,
//                               height: cardButton2.frame.height)
//  }
//  
//  override var intrinsicContentSize: CGSize {
//    return CGSize(width: CustomCard.cardWidth, height: cardButton2.frame.maxY + 8)
//  }
//}
//
//class CardWithImageViewAndButtonsExample: UIViewController {
//  let card: CustomCard = CustomCard()
//
//  @objc var containerScheme: MDCContainerScheming
//
//  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//    containerScheme = MDCContainerScheme()
//    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//  }
//
//  required init?(coder aDecoder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//  }
//
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    view.backgroundColor = containerScheme.colorScheme.backgroundColor
//  }
//
//  override func viewWillAppear(_ animated: Bool) {
//    super.viewWillAppear(animated)
//    setUpCard()
//  }
//
//  func setUpCard() {
//    //let bundle = Bundle(for: CardWithImageViewAndButtonsExample.self)
//    //card.imageView.image = UIImage(named: "sample-image", in: bundle, compatibleWith: nil)
//    card.cardButton1.setTitle("Action 1", for: .normal)
//    card.cardButton2.setTitle("Action 2", for: .normal)
//    card.cardButton1.applyTextTheme(withScheme: containerScheme)
//    card.cardButton2.applyTextTheme(withScheme: containerScheme)
//    card.cornerRadius = 8
//    card.applyTheme(withScheme: containerScheme)
//    card.setNeedsLayout()
//    card.layoutIfNeeded()
//    card.frame = CGRect(x: card.frame.minX,
//                        y: card.frame.minY,
//                        width: card.intrinsicContentSize.width,
//                        height: card.intrinsicContentSize.height)
//    if card.superview == nil { view.addSubview(card) }
//    card.center = view.center
//  }
//}
//
//extension CardWithImageViewAndButtonsExample {
//
//  @objc class func catalogMetadata() -> [String: Any] {
//    return [
//      "breadcrumbs": ["Cards", "Card README example"],
//      "description": "Cards contain content and actions about a single subject.",
//      "primaryDemo": true,
//      "presentable": true,
//    ]
//  }
//}
