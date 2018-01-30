//
//  DetailsViewModel.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/29/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxCocoa
import Moya_ObjectMapper



class DetailsViewModel {
    
    private var mediaObserver: Observable<Media?>!
    private let disposeBag = DisposeBag()
    
    let mediaURLVariable = Variable("")
    
    init(provider: MoyaProvider<InstagramAPI>, mediaId: String) {

        
        mediaObserver = provider.rx.request(InstagramAPI.getMedia(mediaId: mediaId))
            .mapJSON().asObservable().flatMapLatest { (response) -> Observable<Media?> in
                guard let response = response as? [String: Any], let data = response["data"] as? [String: Any] else {
                    return Observable.empty()
                }
                let media = Media(JSON: data)
                return Observable.just(media)
        }
        
        mediaObserver.flatMapLatest { (media) -> Observable<String> in
            guard let media = media else { return Observable.empty() }
            return Observable.just(media.originalImage)
        }
        .bind(to: mediaURLVariable)
        .disposed(by: disposeBag)
    }
}
