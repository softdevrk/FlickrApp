//
//  BaseViewController.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 20/01/2021.
//

import RxSwift

class BaseViewController<T: Any>: UIViewController {
    let viewModel: T
    let disposeBag = DisposeBag()
    
    init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
