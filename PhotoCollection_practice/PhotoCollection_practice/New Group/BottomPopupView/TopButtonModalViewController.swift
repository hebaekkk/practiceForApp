//
//  TopButtonModalViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/15.
//

import UIKit
import PanModal
import SnapKit

class TopButtonModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6977132559, green: 0.08955752105, blue: 0.5810445547, alpha: 1)
        // Do any additional setup after loading the view.
    }
    



}


class CloneMultiViewController: UIViewController {

    //MARK: View Component
    private var collectionView: UICollectionView!

    var cellRegisteration: UICollectionView.CellRegistration<DetailCell, Item>!
    var headerRegisteration: UICollectionView.CellRegistration<UICollectionViewListCell, Item>!
    var listAppearance: UICollectionLayoutListConfiguration.Appearance = .insetGrouped
    lazy var listLayout: UICollectionViewLayout = {
        return UICollectionViewCompositionalLayout { (_, layoutEnvironment) -> NSCollectionLayoutSection? in
            var listConfig = UICollectionLayoutListConfiguration(appearance: self.listAppearance)
            //??
            //listConfig.headerMode = .supplementary


            return NSCollectionLayoutSection.list(using: listConfig, layoutEnvironment: layoutEnvironment)
        }
    }()
    
    var dataSource: UICollectionViewDiffableDataSource<Item, Item>!

    //MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6977132559, green: 0.08955752105, blue: 0.5810445547, alpha: 1)
        setupCollectionView()
    }

    //MARK : View setup
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        collectionView.backgroundColor = .systemBackground
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        view.addSubview(collectionView)

        cellRegisteration = UICollectionView.CellRegistration(handler: {
            (cell: DetailCell, _, item: Item) in

//            var content = UIListContentConfiguration.cell()
//            content.image = UIImage(systemName: "star.fill")
//            content.text = "Hi"
//
//            cell.contentConfiguration = content
            cell.heightAnchor.constraint(equalToConstant: 230).isActive = true
        })

        headerRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> {
            (cell, indexPath, item) in
            var content = cell.defaultContentConfiguration()
            content.text = "Head"
            cell.contentConfiguration = content

            let headerDisclosureOption = UICellAccessory.OutlineDisclosureOptions(style: .header)
            cell.accessories = [.outlineDisclosure(options: headerDisclosureOption)]
        }

//        dataSource = UICollectionViewDiffableDataSource<Item,Item>(collectionView: collectionView) {
//            (collectionView, indexPath, listItem) -> UICollectionViewCell? in
//            switch listItem {
//            case .parent
//            }
//        }
//
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension CloneMultiViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var item: Item = Item(title: "Jo")
        if indexPath.row == 0 {
            let cell = collectionView.dequeueConfiguredReusableCell(using: headerRegisteration, for: indexPath, item: item)
            return cell
        }
        else  {
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: item)
        
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let selectedSection = dataSour
    }

//    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        let header = collectionView.dequeueConfiguredReusableSupplementary(using: headerRegisteration, for: indexPath)
//        return header
//    }
//

}
