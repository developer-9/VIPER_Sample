//
//  VIPER_SampleTests.swift
//  VIPER_SampleTests
//
//  Created by Taisei Sakamoto on 2021/11/28.
//

import XCTest
@testable import VIPER_Sample

class VIPER_SampleTests: XCTestCase {
    
    var view: ViewMock!
    var router: RouterMock!
    var searchRepositoryInteractor: RepositoryInteractorMock!
    var presenter: RepositorySearchResultPresenter!
    
    override func setUp() {
        super.setUp()
        
        view = .init()
        router = .init()
        searchRepositoryInteractor = .init()
        presenter = .init(view: view, router: router, searchRepositoryInteractor: searchRepositoryInteractor)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testSearchButtonDidPush() {
        // PresneterにsearchButtonDidPushイベントが届いた時の挙動をテスト
        // SearchRepositoryInteractorに検索を依頼しているか
        // 正常時やエラー時に適切にViewに描画依頼しているか
        XCTContext.runActivity(named: "searchButtonDidPush") { _ in
            XCTContext.runActivity(named: "when before called") { _ in
                XCTContext.runActivity(named: "`fetchRepositories` is not called") { _ in
                    XCTAssertEqual(searchRepositoryInteractor.callCount_fetchRepositories, 0)
                }
            }
            
            XCTContext.runActivity(named: "when after called") { _ in
                XCTContext.runActivity(named: "`fetchRepositories` is called") { _ in
                    presenter.searchButtonDidPush(searchText: "Swift")
                    XCTAssertEqual(searchRepositoryInteractor.callCount_fetchRepositories, 1)
                }
                
                XCTContext.runActivity(named: "when `fetchRepositories` response error") { _ in
                    setUp()
                    searchRepositoryInteractor = .init(result: .failure(NSError()))
                    presenter = .init(view: view, router: router, searchRepositoryInteractor: searchRepositoryInteractor)
                    presenter.searchButtonDidPush(searchText: "Swift")
                    
                    XCTContext.runActivity(named: "`showErrorMessageView` is called") { _ in
                        XCTAssertEqual(view.callCount_showErrorAlert, 1)
                    }
                }
                
                XCTContext.runActivity(named: "when `fetchRepositories` response succeed") { _ in
                    setUp()
                    let repositories = [
                        RepositoryEntity(id: 0, name: "Swift", fullname: "apple/Swift", htmlUrl: URL(string: "https://github.com/apple/Swift/")!, starCount: 10000, owner: UserEntity(id: 0, login: "apple"))
                    ]
                    searchRepositoryInteractor = .init(result: .success(repositories))
                    presenter = .init(view: view, router: router, searchRepositoryInteractor: searchRepositoryInteractor)
                    presenter.searchButtonDidPush(searchText: "Swift")
                    
                    XCTContext.runActivity(named: "`updateRepositories` is called") { _ in
                        XCTAssertEqual(view.callCount_updateRepositories, 1)
                    }
                }
            }
        }
    }
    
    // MARK: - Mock

    class ViewMock: RepositorySearchResultView {
        
        var callCount_setLastSearchText = 0
        func setLastSearchText(_ text: String) {
            callCount_setLastSearchText += 1
        }
        
        var callCount_showRefreshView = 0
        func showRefreshView() {
            callCount_showRefreshView += 1
        }
        
        var callCount_updateRepositories = 0
        func updateRepositories(_ repositories: [RepositoryEntity]) {
            callCount_updateRepositories += 1
        }
        
        var callCount_showErrorAlert = 0
        func showErrorAlert() {
            callCount_showErrorAlert += 1
        }
    }

    class RouterMock:RepositorySearchResultWireframe {
        
        var isCalled_showRepositoryDetail = false
        func showRepositoryDetail(_ repository: RepositoryEntity) {
            isCalled_showRepositoryDetail = true
        }
    }

    class RepositoryInteractorMock: SearchRepositoryUsecase {
        
        let result: Result<[RepositoryEntity], Error>
        
        init(result: Result<[RepositoryEntity], Error> = .failure(NSError())) {
            self.result = result
        }
        
        var callCount_fetchRepositories = 0
        func fetchRepositories(keyword: String, completion: @escaping (Result<[RepositoryEntity], Error>) -> Void) {
            callCount_fetchRepositories += 1
            completion(result)
        }
    }
}
