//
//  DynamicHeightViewController.swift
//  PhotoCollection_practice
//
//  Created by BigHand on 2021/02/02.
//

import UIKit

class DynamicHeightViewController: UIViewController {

    private var shuffledSeedArray = [Token]()
    private var correctSeedArray = [Token]()
    private var topCollView: DynamicHeightCollectionView!
    private var bottomCollView: DynamicHeightCollectionView!
    private var scrollView = UIScrollView.init()
    private var contentView = UIView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    private func setupViews() {
        self.navigationItem.title = "내가 만들었지롱"
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint.init(item: contentView,
                                                       attribute: .height,
                                                       relatedBy: .equal,
                                                       toItem: self.view,
                                                       attribute: .height,
                                                       multiplier: 1,
                                                       constant: 0)
        heightConstraint.priority = UILayoutPriority.init(200)
        
        //MARK : ScrollView Setting하는법
        self.view.addSubview(scrollView)
        self.view.addConstraints([
            self.scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            self.scrollView.heightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.heightAnchor),
            self.scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        ])
        
        self.scrollView.addSubview(contentView)
        let padding = self.navigationController?.navigationBar.frame.maxY ?? 0
        self.scrollView.addConstraints([
            self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: -(padding)),
            self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor)
        ])
        
        self.view.addConstraints([
            self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            heightConstraint
        ])
        
        let topLabel = returnLabel(with: "안녕하세요 원숭이 입니다. 우끼끼")
        let bottomLabel = returnLabel(with: "SME(Records/Columbia 대행); CMRRA, UNIAO BRASILEIRA DE EDITORAS DE MUSICA - UBEM, BMI - Broadcast Music Inc., AMRA, ARESA, Abramus Digital, LatinAutor - PeerMusic, Sony ATV Publishing, LatinAutor - SonyATV, SOLAR Music Rights Management, LatinAutorPerf, ASCAP, Reel Muzik Werks, LLC, SODRAC, LatinAutor, UMPI, BMG Rights Management (US), LLC, Kobalt Music Publishing 및 음악 권리 단체 14개")
        
        self.topCollView = returnCollView()
        self.topCollView.register(TokenMainCell.self, forCellWithReuseIdentifier: TokenMainCell.identifier)
        self.topCollView.layer.cornerRadius = 10.0
        self.topCollView.layer.borderColor = #colorLiteral(red: 0.4039215686, green: 0.4666666667, blue: 0.7215686275, alpha: 1).cgColor
        self.topCollView.layer.borderWidth = 1.25
        self.topCollView.isDynamcSizeRequired = true//다이나믹한 사이즈 필요합니까? 넵!
        
        self.bottomCollView = returnCollView()
        self.bottomCollView.register(TokenListCell.self, forCellWithReuseIdentifier: TokenMainCell.identifier)

        topLabel.setContentHuggingPriority(.init(800), for: .vertical)
        bottomLabel.setContentHuggingPriority(.init(799), for: .vertical)
        
        let topStack = UIStackView(arrangedSubviews: [topLabel, topCollView])
        topStack.translatesAutoresizingMaskIntoConstraints = false
        topStack.axis = .vertical
        topStack.spacing = 8.0
        
        let bottomStack = UIStackView(arrangedSubviews: [bottomLabel, bottomCollView])
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
//        bottomStack.axis = .vertical
//        bottomStack.spacing = 8.0
        
        //VerifyButton
        let verifyButton = UIButton.init(frame: .zero)
        verifyButton.backgroundColor = #colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1)
        verifyButton.setTitle("VERIFY", for: .normal)
        verifyButton.setTitleColor(.white, for: .normal)
        verifyButton.addTarget(self, action: #selector(onClickOfButton(_:)), for: .touchUpInside)
        verifyButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(verifyButton)
        
        self.contentView.addSubview(topStack)
        self.contentView.addSubview(bottomStack)
        self.contentView.addSubview(verifyButton)
        
        self.contentView.addConstraints([
            topStack.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            topStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            topStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            topStack.heightAnchor.constraint(greaterThanOrEqualToConstant: 250),
            
            //Height 설정해주고 밑에 올 stack뷰 위에 뷰의 bottom에 top걸어주면 됩니다.
            bottomStack.topAnchor.constraint(equalTo: topStack.bottomAnchor, constant: 16),
            bottomStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            bottomStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            bottomStack.heightAnchor.constraint(greaterThanOrEqualToConstant: self.bottomCollView.contentSize.height + 30),
            bottomStack.bottomAnchor.constraint(equalTo: verifyButton.topAnchor, constant: -16),
            
            verifyButton.topAnchor.constraint(equalTo: bottomStack.bottomAnchor, constant: 16),
            verifyButton.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            verifyButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            verifyButton.heightAnchor.constraint(equalToConstant: 50),
            verifyButton.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor, constant: -16)//??? 머선 말이지
        ])
    }
    
    private func fetchShuffledRecoveryKey(){
        let spinner = Spinner.init()
        spinner.showInView(self.view, inBounds: self.view.bounds)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            spinner.hide()
            for (indx, str) in  ["BasicOperators", "Strings", "Characters", "CollectionTypes", "ControlFlow", "Closures", "AdvancedOperators", "AccessControl", "Memory", "Generics", "Error", "Deinitialization","ㄱ","ㄴ","ㄷ","ㄹ"].enumerated() {
                self.shuffledSeedArray.append(Token(title: str, id: indx, selected: false))
            }
            self.bottomCollView.reloadData()
            self.bottomCollView.layoutIfNeeded()
        }
    }
    
    private func sendArrangedSeedToRemote() {
        let alert = UIAlertController.init(title: "Sending", message: "Please wait...", preferredStyle: .alert)
        alert.view.tintColor = #colorLiteral(red: 0.2588235294, green: 0.3098039216, blue: 0.5215686275, alpha: 1)

        alert.addAction(.init(title: "Cancel", style: .default, handler: nil))
        self.present(alert, animated: true)//, completion: <#T##(() -> Void)?##(() -> Void)?##() -> Void#>)
        
    }
    
    @objc func onClickOfButtons(_ sender: UIButton) {
        self.sendArrangedSeedToRemote()
    }
    
    private func returnLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = #colorLiteral(red: 0.4666666667, green: 0.4666666667, blue: 0.4666666667, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func returnCollView() -> DynamicHeightCollectionView {
        //Layout Flow 변수 만들어 준다
        let layout = TokenCollectionViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .vertical
        
        let collectionView = DynamicHeightCollectionView.init(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.8944116831, green: 0.277208358, blue: 0.911613822, alpha: 0.6066550926)
        return collectionView
    }

  

}

extension DynamicHeightViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == topCollView {
            return correctSeedArray.count
        } else {
            return shuffledSeedArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == topCollView {
            guard let cell = self.topCollView.dequeueReusableCell(withReuseIdentifier: TokenMainCell.identifier, for: indexPath) as? TokenMainCell else { return TokenMainCell() }
            cell.token = self.correctSeedArray[indexPath.item]
        }
    }
    
    
}
