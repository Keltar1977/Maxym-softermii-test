//
//  HomeViewModel.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/28/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa
import Moya_ObjectMapper
import RxDataSources

typealias RxDataSource = RxCollectionViewSectionedReloadDataSource

class HomeViewModel {
    
    typealias DataSourceItem = SectionModel<String, Media>
    var  items: Observable<[DataSourceItem]>
    var dataSource: RxDataSource<DataSourceItem>!

    init(provider: MoyaProvider<InstagramAPI>) {
        
        let userDriver = provider.rx.request(InstagramAPI.getUser())
            .mapObject(User.self)
            .asDriver(onErrorJustReturn: User())
        
        items = provider.rx.request(InstagramAPI.getRecentMedia())
            .mapJSON().asObservable().flatMapLatest { (response) -> Observable<[DataSourceItem]> in
                guard let response = response as? [String: Any], let data = response["data"] as? [[String: Any]] else {
                    return Observable.empty()
                }
                let mediaArray = data.flatMap { Media(JSON: $0) }
                return Observable.just([SectionModel(model: "Media", items: mediaArray)])
            }
        
        dataSource = RxCollectionViewSectionedReloadDataSource(configureCell: { (ds, cv, ip, item) -> UICollectionViewCell in
            let cell = cv.dequeueReusableCell(withReuseIdentifier: "MediaCell", for: ip) as! MediaCollectioCollectionViewCell
            cell.configure(with: item)
            return cell
        }, configureSupplementaryView: { (ds, cv, kind, ip) -> UICollectionReusableView in
            let section = cv.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Header", for: ip) as! HeaderView
            userDriver.drive(onNext: { (user) in
                section.setup(with: user)
            }).disposed(by: section.disposeBag)
            return section
        })
    }
}
