//
//  MainViewImageCollectionViewCell.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import UIKit
import DomainPlatform
import Kingfisher

class MainViewImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!

    func configure(with viewModel: MainViewImageCellViewModel) {
        if !viewModel.withEffect {
            imageView.kf.setImage(with: viewModel.url, placeholder: UIImage(systemName: "photo"))
        } else {
            let processor = BlurImageProcessor(blurRadius: imageView.frame.width / 2)
            
            imageView.kf.setImage(with: viewModel.url, placeholder: UIImage(systemName: "photo"), options: [
                .processor(processor),
                .transition(.fade(0.5)),
                .cacheOriginalImage
            ])
        }
    }
}
