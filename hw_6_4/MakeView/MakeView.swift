//
//  MakeView.swift
//  hw_6_4
//
//  Created by Erma on 1/2/24.
//

import UIKit

class MakeView{
    
    static let shared = MakeView()
    
    func makerLabel(text:String = "",
                    textColor: UIColor = .white,
                    textSize:CGFloat = 20,
                    textWeight:UIFont.Weight = .regular,
                    textNumberOfLines: Int = 0
                    ) -> UILabel {
        let view = UILabel()
        view.text = text
        view.textColor = textColor
        view.font = .systemFont(ofSize: textSize,weight: textWeight)
        view.numberOfLines = textNumberOfLines
        return view
    }
    

    
    func makerImage(imageName: String = "",
                    imageContentMode: UIView.ContentMode = .scaleAspectFill,
                    imageBackgroundColor: UIColor = .white,
                    imageTintColor: UIColor = .white
                    )-> UIImageView{
        let view = UIImageView()
        view.image = UIImage(named: imageName)
        view.contentMode = imageContentMode
        view.backgroundColor = imageBackgroundColor
        view.tintColor = imageTintColor
        return view
    }
    
    func  makerCollectionView(cvItemWidth: CGFloat,
                              cvItemSize: CGFloat,
                              cvMinimumLineSpacing: CGFloat = 20,
                              cvMinimumInteritemSpacing: CGFloat = 0,
                              cvScrollDirection: UICollectionView.ScrollDirection = .vertical,
                              cvCornerRadius: CGFloat = 16,
                              cvBackgroundColor: UIColor?
    ) -> UICollectionView{
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: cvItemWidth, height: cvItemSize)
        layout.minimumLineSpacing = cvMinimumLineSpacing
        layout.minimumInteritemSpacing = cvMinimumInteritemSpacing
        layout.scrollDirection = cvScrollDirection
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.layer.cornerRadius = cvCornerRadius
        cv.backgroundColor = cvBackgroundColor
        return cv
    }
    
}

