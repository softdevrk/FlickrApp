//
//  MainViewController.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 20/01/2021.
//

import UIKit
import RxSwift

class MainViewController: BaseViewController<MainViewModelProtocol> {
    
    @IBOutlet private weak var searchTextField: UITextField!
    @IBOutlet private weak var toggleEffectSwitch: UISwitch!
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private let flow: MainFlowProtocol
    
    init(viewModel: MainViewModelProtocol, flow: MainFlowProtocol) {
        self.flow = flow
        super.init(viewModel: viewModel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        setupCollectionView()
        super.viewDidLoad()
        
        disposeBag.insert(
            searchTextField.rx.text.orEmpty.skip(1).debounce(RxTimeInterval.seconds(1), scheduler: MainScheduler.instance).subscribe(onNext: { [weak self] searchPhrase in
                self?.fetchData(for: searchPhrase)
            }),
            viewModel.isToggleEffectEnabled.bind(to: toggleEffectSwitch.rx.isEnabled),
            viewModel.collectionViewDataSource.bind(to: collectionView.rx.items(cellIdentifier: MainViewImageCollectionViewCell.identifier)) { _, model, cell in
                guard let imageCell = cell as? MainViewImageCollectionViewCell else {
                    return
                }
                
                imageCell.configure(with: model)
            },
            toggleEffectSwitch.rx.isOn.bind(to: viewModel.isEffectOn),
            toggleEffectSwitch.rx.controlEvent(.valueChanged).bind { [weak self] in
                self?.viewModel.reloadData()
            },
            collectionView.rx.setDelegate(self)
        )
    }

    private func fetchData(for searchPhrase: String) {
        viewModel.fetchData(for: searchPhrase)
            .subscribe()
            .disposed(by: disposeBag)
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    private func setupCollectionView() {
        collectionView.register(UINib(nibName: MainViewImageCollectionViewCell.name, bundle: nil), forCellWithReuseIdentifier: MainViewImageCollectionViewCell.identifier)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  40
        let cellWidth = (collectionView.frame.size.width - padding) / 2

        return CGSize(width: cellWidth, height: cellWidth)
    }
}
