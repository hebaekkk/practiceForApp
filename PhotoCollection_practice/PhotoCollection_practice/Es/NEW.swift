//
//  NEW.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/03/18.
//

import UIKit

class NEW: UIViewController {
    
    //MARK: Identifier Types
    struct Parent: Hashable {
        var title: String
        var children: [Child]
    }
    struct Child: Hashable {
        let title: String
    }
    
    struct Sup: Hashable {
        let title: String
    }
    enum DataItem: Hashable {
        case parent(Parent)
        case child(Child)
        case sup(Sup)
    }
    
    //MARK : Model object
    let model = [Parent(title: "A",
                        children: [Child(title: "1"),Child(title: "2")]),
                 Parent(title: "B",
                        children: [Child(title: "ㄱ"),Child(title: "ㄴ")])
                ]
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Parent, DataItem>!
    
    var headerRegisteration: UICollectionView.CellRegistration<UICollectionViewListCell, Parent>!
    var listRegisteration: UICollectionView.CellRegistration<UICollectionViewListCell, Child>!
    
    //MARK : Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.6977132559, green: 0.08955752105, blue: 0.5810445547, alpha: 1)
        self.title = "^ 0 ^ NEW"
        setupCollView()
    }
    
    //MARK : Setup View
    func setupCollView() {
        
        //MARK : Create list layout
        var layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)// 동그랗게 예쁘게 나온겨
        layoutConfig.headerMode = .firstItemInSection
        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
        
        //MARK : Configure collection view
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
        
        collectionView.delegate = self
        //collectionView.dataSource = self
        

        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 0.0),
                                     collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
                                     collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
                                     collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0)])
        
        //MARK: Cell Registeration
        headerRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell, Parent> {
            (cell, indexPath, parent) in

            //Set parent title to header cell
            var content = cell.defaultContentConfiguration()
            content.text = parent.title
            cell.contentConfiguration = content

            let headerDisclosureOption = UICellAccessory.OutlineDisclosureOptions(style: .header)
            cell.accessories = [.outlineDisclosure(options: headerDisclosureOption)]
        }

        listRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell, Child> {
            (cell, indexPath, child) in

            //Set child title to cell
            var content = cell.defaultContentConfiguration()
            content.text = child.title
            cell.contentConfiguration = content
        }
//
        
        collectionView.register(DetailCell.self, forCellWithReuseIdentifier: DetailCell.identifier)

        //MARK: Initialize data source
        dataSource = UICollectionViewDiffableDataSource<Parent, DataItem>(collectionView: collectionView) {
            (collectionView, indexPath, listItem) -> UICollectionViewCell? in

            switch listItem {
            case .parent(let parent):
                let cell = collectionView.dequeueConfiguredReusableCell(using: self.headerRegisteration,
                                                                        for: indexPath, item: parent)
                return cell
            case .child(let child):
                let cell = collectionView.dequeueConfiguredReusableCell(using: self.listRegisteration, for: indexPath, item: child)
                return cell
                
            case .sup(let sup):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCell.identifier, for: indexPath)
                cell.contentView.heightAnchor.constraint(equalToConstant: 230).isActive = true
                return cell
            }
        }

        
        //MARK : Construct data source snapshot
        //Loop through each parent items to create a section snapshots.
        for parent in model {

            //Create a section snapshot
            var sectionSnapShot = NSDiffableDataSourceSectionSnapshot<DataItem>()// DataItem includes PARENT & CHILD -> CASE GROUP IS 'DataItem'

            //Create a parent DataItem & as parent
            let parentDataItem = DataItem.parent(parent)
            sectionSnapShot.append([parentDataItem])

            //Create an array of child items & append as children of parentDataItem
            let childDataItemArray = parent.children.map { DataItem.child($0) }
            sectionSnapShot.append(childDataItemArray, to: parentDataItem)

            //Expand this section by default
            sectionSnapShot.expand([parentDataItem])
            


            //Apply section snapshot to the respective collection view section
            dataSource.apply(sectionSnapShot, to: parent, animatingDifferences: false)
        }
        
        
        let supItem = DataItem.sup(Sup.init(title: "UU"))
        
        
        
        
    }
    

}

extension NEW: UICollectionViewDelegate {
    
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let selectedSection = dataSource.snapshot().sectionIdentifiers[indexPath.section]
        let selectedSectionSnapshot = dataSource.snapshot(for: selectedSection)
        // 1
        // Optain a reference to the selected parent
        guard let selectedParentDataItem = selectedSectionSnapshot.rootItems.first,
              case let DataItem.parent(selectedParent) = selectedParentDataItem else {
            return
        }
        
        // 2
        // Obtain a reference to the selected child
        let selectedChildDataItem = selectedSectionSnapshot.items[indexPath.row]
        guard case let DataItem.child(selectedChild) = selectedChildDataItem else {
            return
        }
        
        // 3
        // Create a new parent with selectedChild's title
        let newParent = Parent(title: selectedChild.title, children: selectedParent.children)
        let newParentDataItem = DataItem.parent(newParent)
        
        // 4
        // Avoid crash when user tap on same cell twice (snapshot data must be unique)
        guard selectedParent != newParent else {
            return
        }
        
        // 5
        // Replace the parent in section snapshot (by insert new item and then delete old item)
        var newSectionSnapshot = selectedSectionSnapshot
        newSectionSnapshot.insert([newParentDataItem], before: selectedParentDataItem)
        newSectionSnapshot.delete([selectedParentDataItem])
        
        // 6
        // Reconstruct section snapshot by appending children to 'newParentDataItem'
        let allChildDataItems = selectedParent.children.map { DataItem.child($0) }
        newSectionSnapshot.append(allChildDataItems, to: newParentDataItem)
        
        // 7
        // Expand the section
        newSectionSnapshot.expand([newParentDataItem])
        
        // 8
        // Apply new section snapshot to selected section
        dataSource.apply(newSectionSnapshot, to: selectedSection, animatingDifferences: true) {
            //The cell's select state will be gone after applying a new snapshot,
            //thus manually reselecting the cell.
            collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
        }
        
    }
}

