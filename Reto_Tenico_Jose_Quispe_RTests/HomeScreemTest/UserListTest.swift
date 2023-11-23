//
//  UserListTest.swift
//  Reto_Tenico_Jose_Quispe_RTests
//
//  Created by MACJOSE on 21/11/23.
//

import XCTest
@testable import Reto_Tenico_Jose_Quispe_R
import RxSwift

final class UserListTest: XCTestCase {
    
    
    private let webService = WebService()
    private let disposeBag = DisposeBag()
    
    func testUerList() {
        let expectation = XCTestExpectation(description: "List of successful users")
             webService.load(modelType: Users.self, from: .userList(serviceType: .UserList))
                 .observeOn(MainScheduler.instance)
                 .subscribe(onNext: { [weak self] (results) in
                     results.validate {
                         
                         if let listcount = results.results?.count {
                             XCTAssertGreaterThan(listcount, 1, "The array must have more than 1 data")
                         } else {
                             XCTFail("Error empty list")
                         }
                         
                         results.results?.forEach({ items in
                             XCTAssertTrue(items.gender == "female" || items.gender == "male", "Gender is not valid")
                             if let cdate = items.dob?.age {
                                 XCTAssert(type(of: cdate) == Int.self, "The result is not of type Int")
                             }
                            
                             if let url = URL(string:  items.picture?.large ?? "") {
                                 XCTAssertNotNil(url, "The string does not represent a valid URL")
                                 XCTAssertTrue(url.absoluteString.hasSuffix(".jpg"), "The URL does not have a valid image extension")
                             } else {
                                 XCTFail("The string is not a valid URL")
                             }
                         })
                         
                         XCTAssertNotNil(results)
                         expectation.fulfill()
                     }
                 }, onError: { [weak self] (error) in
                     XCTFail("Got error from request: \(error.localizedDescription)")
                 }).disposed(by: disposeBag)
          
             wait(for: [expectation], timeout: 10.0)
    }
}
