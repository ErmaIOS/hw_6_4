//
//  CustomCollectionViewCell.swift
//  hw_6_4
//
//  Created by Erma on 1/2/24.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    
    private lazy var imageSalad:UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
    
    private func setupUI(){
        contentView.addSubview(imageSalad)
        imageSalad.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
    }
    
    
    func setImage(_ image: String){
        imageSalad.image = UIImage(named: image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
