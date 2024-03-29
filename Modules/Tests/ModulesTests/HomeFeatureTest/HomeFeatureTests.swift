import XCTest
@testable import Home
@testable import Models
@testable import Networking

final class ModulesTests: XCTestCase {
    @MainActor func testExample() throws {
        let sut = HomeViewModelImpl(service: .mock, navigator: .init())
        
        sut.fetchProducts()
        
        _ = XCTWaiter.wait(for: [expectation(description: "wait a bit")], timeout: 1)
        
        XCTAssertEqual(sut.products?.count, 3)
    }
}

class MockHomeViewModel: HomeViewModel {
    var products: [Product]?
    
    func fetchProducts() {
        Task {
            products = try await ApiService.mock.fetchProducts()
        }
    }
    
    func showDetail(for product: Product) {
        
    }
}
