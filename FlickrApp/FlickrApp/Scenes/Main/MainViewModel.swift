//
//  MainViewModel.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 20/01/2021.
//

import RxSwift
import RxCocoa
import DomainPlatform

protocol MainViewModelProtocol {
    var isLoading: BehaviorRelay<Bool> { get }
    var isToggleEffectEnabled: BehaviorRelay<Bool> { get }
    var isEffectOn: BehaviorRelay<Bool> { get }
    var collectionViewDataSource: BehaviorRelay<[MainViewImageCellViewModel]> { get }
    func fetchData(for searchPhrase: String) -> Completable
    func reloadData()
}

class MainViewModel: MainViewModelProtocol {
    var isLoading: BehaviorRelay<Bool> = .init(value: false)
    var isToggleEffectEnabled: BehaviorRelay<Bool> = .init(value: false)
    var isEffectOn: BehaviorRelay<Bool> = .init(value: false)
    var collectionViewDataSource: BehaviorRelay<[MainViewImageCellViewModel]> = .init(value: [])
    
    private let getFlickrImagesUseCase: GetFlickrImagesUseCaseProtocol
    
    init(getFlickrImagesUseCase: GetFlickrImagesUseCaseProtocol) {
        self.getFlickrImagesUseCase = getFlickrImagesUseCase
    }
    
    func reloadData() {
        let dataSource = collectionViewDataSource.value
        dataSource.forEach {
            $0.withEffect = isEffectOn.value
        }
        
        collectionViewDataSource.accept(dataSource)
    }
    
    func fetchData(for searchPhrase: String) -> Completable {
        guard !searchPhrase.isEmpty else {
            self.collectionViewDataSource.accept([])
            self.isEffectOn.accept(false)
            self.isToggleEffectEnabled.accept(false)
            return .empty()
        }
        
        return getFlickrImagesUseCase
            .execute(for: searchPhrase)
            .do(onSuccess: { [weak self] result in
                self?.isLoading.accept(false)
                self?.isToggleEffectEnabled.accept(!result.isEmpty)
                
                let dataSource = result.compactMap {
                    MainViewImageCellViewModel(flickrImage: $0, withEffect: self?.isEffectOn.value ?? false)
                }
                self?.collectionViewDataSource.accept(dataSource)
            }, onError: { [weak self] error in
                self?.collectionViewDataSource.accept([])
                self?.isEffectOn.accept(false)
                self?.isToggleEffectEnabled.accept(false)
                self?.isLoading.accept(false)
            }).asCompletable()
    }
}
