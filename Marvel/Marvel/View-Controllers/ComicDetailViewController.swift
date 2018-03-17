//
//  ComicDetailViewController.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import UIKit
protocol ComicDetailProtocol {
    var comicViewModel : ComicViewModel {get}
}
class ComicDetailViewController: UIViewController {
    var delegate:ComicDetailProtocol! = nil
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var descriptionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundImage()
        setDescriptionTextView()
    }
    fileprivate func setDescriptionTextView(){
        guard let title = delegate.comicViewModel.title else {return}
        guard let description = delegate.comicViewModel.description else {return}
        guard let contentForTextView = NSMutableAttributedString.setTitleAndDescription(wit: title, description: description) else {return}
        descriptionTextView.attributedText = contentForTextView
        descriptionTextView.textColor = .white
    }
    fileprivate func setBackgroundImage() {
        guard let coverURL = delegate.comicViewModel.coverURL else {return}
        guard let url = URL(string:coverURL)  else {return}
        backgroundImageView.kf.setImage(with: url)
    }
}
