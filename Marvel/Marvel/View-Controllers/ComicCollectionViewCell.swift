//
//  ComicCollectionViewCell.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import UIKit
class ComicCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var coverImageView: UIImageView!
    func setImageView(with comicViewModel:ComicViewModel){
        guard let miniCover = comicViewModel.miniCover else {return}
        guard let url = URL(string:miniCover)  else {return}
        coverImageView.kf.setImage(with: url)
    }
}
