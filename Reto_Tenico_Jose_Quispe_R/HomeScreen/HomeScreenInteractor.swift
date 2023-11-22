//
//  HomeScreenInteractor.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MAC9STRATIS001 on 21/11/23.
//

import RxSwift

class HomeScreenInteractor : HomeScreenPresenterToInteractorProtocol {
    
    var presenter: HomeScreenInteractorToPresenterProtocol?
    
    private let webService = WebService()
    private let disposeBag = DisposeBag()
    
    func prepareResponseForModel() {
        webService.load(modelType: Users.self, from: .userList(serviceType: .UserList))
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (results) in
                results.validate {
                    self?.presenter?.fetchedDataSuccess(data: results)
                }
            }, onError: { [weak self] (error) in
                self?.presenter?.fetchedDataError()
            }).disposed(by: disposeBag)
    }
    
    
}
