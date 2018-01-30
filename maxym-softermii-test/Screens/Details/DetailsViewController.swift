//
//  DetailsViewController.swift
//  maxym-softermii-test
//
//  Created by Maxym on 1/29/18.
//  Copyright © 2018 Maxym. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class DetailsViewController: UIViewController {

    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    private var mediaId = ""
    let provider = APIProvider.provider()
    private let disposeBag = DisposeBag()
    
    var viewModel: DetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx()
        setupScrollView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupRx() {
        viewModel = DetailsViewModel(provider: provider, mediaId: mediaId)
        viewModel.mediaURLVariable
        .asObservable()
            .subscribe(onNext: { [unowned self] (imageURL) in
                self.imageView.sd_setImage(with: URL(string: imageURL))
            }).disposed(by: disposeBag)
        
        shareButton.rx.tap.asObservable()
            .subscribe(onNext: { [unowned self] (_) in
                let text = self.viewModel.mediaURLVariable.value
                let textToShare = [ text ]
                let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view
                activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
                self.present(activityViewController, animated: true, completion: nil)
            }).disposed(by: disposeBag)
    }
    
    func setMediaId(_ mediaId: String) {
        self.mediaId = mediaId
    }
    
    private func setupScrollView() {
        scrollView.delegate = self
        scrollView.alwaysBounceVertical = false
        scrollView.alwaysBounceHorizontal = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.flashScrollIndicators()
        
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 10.0
        
        imageView!.clipsToBounds = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailsViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
