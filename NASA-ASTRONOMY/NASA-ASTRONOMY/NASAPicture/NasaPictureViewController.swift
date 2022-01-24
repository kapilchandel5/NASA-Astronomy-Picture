//
//  NasaPictureViewController.swift
//  NASA-ASTRONOMY
//
//  Created by Kapil Chandel on 24/01/22.
//

import UIKit

class NasaPictureViewController: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var activity: UIActivityIndicatorView!
    
    var viewModel = NasaPictureViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    private func bindViewModel() {
        
        viewModel.responseCallBack = { [weak self] detail in
            self?.dateLbl.text = detail.date
            self?.descriptionLbl.text = detail.explanation
            self?.titleLbl.text = detail.title
            self?.imageView.downloaded(from: detail.url)
            self?.activity.isHidden = true
        }
        
        viewModel.alertCallBack = { [weak self] error in
            var message = Alert.defaultMessage
            if error == .lastCachedReponse {
                message = Alert.cachedMessage
            }
            let alert = UIAlertController(title: Alert.title,
                                          message: message,
                                          preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: Alert.buttonTitle,
                                          style: UIAlertAction.Style.default,
                                          handler: nil))
            self?.present(alert, animated: true, completion: nil)
            self?.activity.isHidden = true
        }
    }
}
