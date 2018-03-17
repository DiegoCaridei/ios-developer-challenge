//
//  MainViewController.swift
//  Marvel
//
//  Created by Diego Caridei on 17/03/18.
//  Copyright © 2018 Diego Caridei. All rights reserved.
//
import UIKit
import Kingfisher
internal enum IDENTIFIER {
    static let cellID = "comicCell"
    static let segueID = "detailViewController"
}
class MainViewController: UIViewController {
    var listComicsViewModel : ComicListViewModel?
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    var comicViewModels:ComicViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionViewLayout()
        fetchComics()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == IDENTIFIER.segueID {
            guard let comicDetailViewController = segue.destination as? ComicDetailViewController else {return}
            comicDetailViewController.delegate = self
        }
    }
    fileprivate func fetchComics() {
        DataProvider.getComics {[weak self] (comics) in
            self?.listComicsViewModel = comics
            self?.comicsCollectionView.reloadData()
        }
    }
}
//MARK:- ComicDetailProtocol
extension MainViewController:ComicDetailProtocol{
    var comicViewModel : ComicViewModel {
        return comicViewModels
    }
}
//MARK:- UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewLayoutSettings
extension MainViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let numberOfRows =  listComicsViewModel?.comicsViewModel.count else { return 0 }
        return numberOfRows
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IDENTIFIER.cellID, for: indexPath) as? ComicCollectionViewCell else {
            fatalError("Could not dequeue cell with identifier")
        }
        if let comicViewModel = self.listComicsViewModel?.comicsViewModel[indexPath.row]  {
            cell.setImageView(with: comicViewModel)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let comicVM = self.listComicsViewModel?.comicsViewModel[indexPath.row]
        comicViewModels = comicVM
    }
    fileprivate func setCollectionViewLayout(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = UIScreen.main.bounds.width
        let sectionInset : CGFloat = 5
        let size = width / 3
        layout.sectionInset = UIEdgeInsets(top: sectionInset, left: sectionInset, bottom: sectionInset, right: sectionInset)
        layout.itemSize = CGSize(width: size, height: size)
        layout.scrollDirection = .horizontal
        comicsCollectionView.collectionViewLayout = layout
    }
}
