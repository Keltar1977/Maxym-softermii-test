//
//  HomeViewController.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/28/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var viewModel: HomeViewModel!
    let provider = APIProvider.provider()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupRx()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setupCollectionView() {
        
        collectionView.register(UINib(nibName: HeaderView.identifier, bundle: nil),
                                forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                withReuseIdentifier: "Header")
        collectionView.register(UINib(nibName: MediaCollectioCollectionViewCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: "MediaCell")
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemWidth = (collectionView.frame.size.width - 2 * flowLayout.minimumInteritemSpacing)/3
            flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        }
    }
    
    private func setupRx() {
        viewModel = HomeViewModel(provider: provider)
        
        viewModel.items
            .bind(to: collectionView.rx.items(dataSource: viewModel.dataSource))
            .disposed(by: disposeBag)
    }
}
