//////
//////  CloneMultiViewController.swift
//////  PhotoCollection_practice
//////
//////  Created by BigHand on 2021/03/17.
//////
////
//import UIKit
//
//class Hi: UIViewController {
//
//    let modelObjects = [
//
//        HeaderItem(title: "Communication", symbols: [SFSymbolItem(name: "mic")]),
//        HeaderItem(title: "Weather", symbols: [SFSymbolItem(name: "sun.min"),
//                                               ])
//    ]
//
//    var collectionView: UICollectionView!
//    var dataSource: UICollectionViewDiffableDataSource<HeaderItem, ListItem>!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.title = "MultiSection"
//        self.view.backgroundColor = .white
//        //MARK: Create list Layout
//        var layoutConfig = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
//        layoutConfig.headerMode = .firstItemInSection
//
//
//        let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
////        collectionView.delegate = self
////        collectionView.dataSource = self
//        //MARK: Configure collection view
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
//        view.addSubview(collectionView)
//
//        //Make CollectionView take up the entire view
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//
//
//        // MARK : Cell registeration
//        let headerCellRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell, HeaderItem> {
//            (cell, indexPath, headerItem) in
//            var content = cell.defaultContentConfiguration()
//            content.text = headerItem.title
//            cell.contentConfiguration = content
//
//            let headerDisclosureOption = UICellAccessory.OutlineDisclosureOptions(style: .header)
//            cell.accessories = [.outlineDisclosure(options: headerDisclosureOption)]
//
//        }
//
//        let symbolCellRegisteration = UICollectionView.CellRegistration<DetailCell, SFSymbolItem> {
//            (cell, indexPath, symbolItem) in
//            //cell.translatesAutoresizingMaskIntoConstraints = false
//            //cell.heightAnchor.constraint(equalToConstant: 230).isActive = true
////            let heightAnchor = cell.contentView.heightAnchor.constraint(equalToConstant: 44)
////            heightAnchor.priority = UILayoutPriority(rawValue: 750)
////            cell.layoutSubviews()
//
//            //cell.autoresizesSubviews = true
//            cell.heightAnchor.constraint(equalToConstant: 230).isActive = true
//            //cell.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
////            var content = cell.defaultContentConfiguration()
////            content.image = symbolItem.image
////            content.text = symbolItem.name
////            cell.contentConfiguration = content
//            //cell.r
//        }
//
//
//
//        dataSource = UICollectionViewDiffableDataSource<HeaderItem, ListItem>(collectionView: collectionView) {
//            (collectionView, indexPath, listItem) -> UICollectionViewCell? in
//
//            switch listItem {
//            case .header(let headerItem):
//
//                let cell = collectionView.dequeueConfiguredReusableCell(using: headerCellRegisteration, for: indexPath, item: headerItem)
//                return cell
//            case .symbol(let symbolItem):
//
//                let cell = collectionView.dequeueConfiguredReusableCell(using: symbolCellRegisteration, for: indexPath, item: symbolItem)
//                return cell
//            }
//        }
//
//        var dataSourceSnapshot = NSDiffableDataSourceSnapshot<HeaderItem, ListItem>()
//
//        dataSourceSnapshot.appendSections(modelObjects)
//        dataSource.apply(dataSourceSnapshot)
//
//        for headerItem in modelObjects {
//            var sectionSnapshot = NSDiffableDataSourceSectionSnapshot<ListItem>()
//
//            let headerListItem = ListItem.header(headerItem)
//            sectionSnapshot.append([headerListItem])
//
//            let symbolListItemArray = headerItem.symbols.map { ListItem.symbol($0)}
//            sectionSnapshot.append(symbolListItemArray, to: headerListItem)
//
//            sectionSnapshot.expand([headerListItem])
//
//            dataSource.apply(sectionSnapshot, to: headerItem, animatingDifferences: false)
//        }
////        collectionView.dataSource = self
////        collectionView.delegate = self
//
//
//
//    }
//
////    override func viewDidLayoutSubviews() {
////        super.viewDidLayoutSubviews()
////        collectionView.frame = view.bounds
////    }
//
//}
////extension CloneMultiViewController: UICollectionViewDataSource, UICollectionViewDelegate {
////    func numberOfSections(in collectionView: UICollectionView) -> Int {
////        return 2
////    }
////
////    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
////        return 2
////    }
////
////    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
////        let
////    }
////
////
////
////
////}
//////
//import UIKit
//
//class CloneMultiViewController: UIViewController {
//
//    //MARK: View Component
//    private var collectionView: UICollectionView!
//
//    var cellRegisteration: UICollectionView.CellRegistration<DetailCell, Item>!
//    var headerRegisteration: UICollectionView.CellRegistration<UICollectionViewListCell, Item>!
//    var listAppearance: UICollectionLayoutListConfiguration.Appearance = .insetGrouped
//    lazy var listLayout: UICollectionViewLayout = {
//        return UICollectionViewCompositionalLayout { (_, layoutEnvironment) -> NSCollectionLayoutSection? in
//            var listConfig = UICollectionLayoutListConfiguration(appearance: self.listAppearance)
//            //??
//            listConfig.headerMode = .supplementary
//
//
//            return NSCollectionLayoutSection.list(using: listConfig, layoutEnvironment: layoutEnvironment)
//        }
//    }()
//
//    //MARK : Life Cycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupCollectionView()
//    }
//
//    //MARK : View setup
//    private func setupCollectionView() {
//        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: listLayout)
//        collectionView.backgroundColor = .systemBackground
//        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//
//        view.addSubview(collectionView)
//
//        cellRegisteration = UICollectionView.CellRegistration(handler: {
//            (cell: DetailCell, _, item: Item) in
//
////            var content = UIListContentConfiguration.cell()
////            content.image = UIImage(systemName: "star.fill")
////            content.text = "Hi"
////
////            cell.contentConfiguration = content
//            cell.heightAnchor.constraint(equalToConstant: 230).isActive = true
//        })
//
//        headerRegisteration = UICollectionView.CellRegistration<UICollectionViewListCell, Item> {
//            (cell, indexPath, item) in
//            var content = cell.defaultContentConfiguration()
//            content.text = "Head"
//            cell.contentConfiguration = content
//
//            let headerDisclosureOption = UICellAccessory.OutlineDisclosureOptions(style: .header)
//            cell.accessories = [.outlineDisclosure(options: headerDisclosureOption)]
//        }
//
//        //collectionView.dataSource = self
//        //collectionView.delegate = self
//    }
//}
//
//extension CloneMultiViewController: UICollectionViewDataSource, UICollectionViewDelegate {
//
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return 2
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        var item: Item = Item(title: "Jo")
//        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegisteration, for: indexPath, item: item)
//        return cell
//    }
//
//
////    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
////        let header = collectionView.dequeueConfiguredReusableSupplementary(using: headerRegisteration, for: indexPath)
////        return header
////    }
////
//
//}
