//
//  ViewController.swift
//  hw_6_4
//
//  Created by Erma on 1/2/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UICollectionViewDataSource {
    
    
    private lazy var backImage: UIImageView = MakeView.shared.makerImage(imageName: "backImage",imageBackgroundColor: .white, imageTintColor: .black)
    
    private lazy var saladLabel: UILabel = MakeView.shared.makerLabel(text: "Salad",textColor: .black,textSize: 25,textWeight: .bold)
    
    private lazy var loopImage: UIImageView = MakeView.shared.makerImage(imageName: "loopImage",imageBackgroundColor: .white, imageTintColor: .black)
    
    private lazy var horizontalCollectionView: UICollectionView = MakeView.shared.makerCollectionView(cvItemWidth: UIScreen.main.bounds.width - 40, cvItemSize: 160,cvMinimumLineSpacing: 20,cvMinimumInteritemSpacing: 0, cvSectionInset: .init(top: 0, left: 20, bottom: 0, right: 0),cvScrollDirection: .horizontal,cvCornerRadius: 16, cvBackgroundColor: .white)
    
    private lazy var sortByLabel: UILabel = MakeView.shared.makerLabel(text: "Sort by",textColor: .black,textSize: 20,textWeight: .bold)
    

    private lazy var mostPopularLabel: UILabel = MakeView.shared.makerLabel(text: "Most Popular",textColor: .red,textSize: 15)
    
    
    private lazy var upDownImage: UIImageView = MakeView.shared.makerImage(imageName: "arrowUpDown",imageTintColor: .red)
    
    
    private lazy var verticalCollectionView: UICollectionView = MakeView.shared.makerCollectionView(cvItemWidth: (UIScreen.main.bounds.width / 2) - 40, cvItemSize: 200, cvMinimumLineSpacing: 20,cvMinimumInteritemSpacing: 0, cvSectionInset: .init(top: 0, left: 0, bottom: 0, right: 20),cvScrollDirection: .vertical,cvCornerRadius: 16,cvBackgroundColor: .white)

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupUI()
    }

    private func setupUI(){
        view.backgroundColor = .white
        horizontalCollectionView.dataSource = self
        horizontalCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        verticalCollectionView.dataSource = self
        verticalCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "item")
        
        view.addSubview(backImage)
        view.addSubview(saladLabel)
        view.addSubview(loopImage)
        view.addSubview(horizontalCollectionView)
        view.addSubview(sortByLabel)
        view.addSubview(mostPopularLabel)
        view.addSubview(upDownImage)
        view.addSubview(verticalCollectionView)
       
        
        setupCollectionView()
        setupLabel()
        setupImage()
    }
    
    
    
    
        private func setupCollectionView(){
            horizontalCollectionView.snp.makeConstraints { make in
                make.top.equalTo(backImage.snp.bottom).offset(25)
                make.horizontalEdges.equalToSuperview()
                make.height.equalTo(160)
            }
            
            verticalCollectionView.snp.makeConstraints { make in
                make.top.equalTo(sortByLabel.snp.bottom).offset(25)
                make.horizontalEdges.equalToSuperview().inset(20)
                make.bottom.equalToSuperview()
            }
            
        }
    
    
    
    private func setupLabel(){
        saladLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(backImage.snp.trailing).offset(15)
            make.centerY.equalTo(backImage)
        }
        sortByLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalCollectionView.snp.bottom).offset(25)
            make.leading.equalToSuperview().offset(20)
        }
        
        mostPopularLabel.snp.makeConstraints { make in
            make.top.equalTo(horizontalCollectionView.snp.bottom).offset(25)
            make.trailing.equalTo(upDownImage.snp.leading).offset(-10)
            make.centerY.equalTo(sortByLabel)
        }
    }
        
    private func setupImage(){
        backImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(20)
            make.height.width.equalTo(25)
        }
        
        loopImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalToSuperview().offset(-20)
            make.height.width.equalTo(30)
            make.centerY.equalTo(saladLabel)
        }
        
        upDownImage.snp.makeConstraints { make in
            make.top.equalTo(horizontalCollectionView.snp.bottom).offset(25)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalTo(mostPopularLabel)
            make.height.width.equalTo(21)
        }
    }
        
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == horizontalCollectionView {
                return 50
            } else if collectionView == verticalCollectionView {
                return 50
            } else {
                return 0
            }
    }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            if collectionView == horizontalCollectionView {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CustomCollectionViewCell
                cell?.setImage("salad")
                return cell ?? UICollectionViewCell()
            } else if collectionView == verticalCollectionView {
                let item = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as? CustomCollectionViewCell
                item?.setImage("burger")
                return item ?? UICollectionViewCell()
            } else {
                return UICollectionViewCell()
            }
        }

        
        
    
}
