import Foundation
import Resolver
import MustacheServices
import MustacheFoundation
import Combine

protocol ___FILEBASENAME___Type {
    
    var model: Model? { get }
    
    var modelPublisher: AnyPublisher<Model?, Never> { get }
    
    func save(_ model: Model) async throws
    
}

class ___FILEBASENAME___: ___FILEBASENAME___Type {

    // MARK: Variables
    
    var model: Model? {
        return self.modelService.model
    }
    
    var modelPublisher: AnyPublisher<Model?, Never> {
        return self.modelService.modelPublisher
    }

    // MARK: Services
    
    @Injected
    private var modelService: ModelServiceType

    // MARK: State variables
    
    let lock = NSLock()

    // MARK: Init

    init() {
        self.configure()
    }

    // MARK: Configure

    func configure() {}
    
    // MARK: functions

    func save(_ model: Model) async throws {
        try await self.modelService.save(model: model)
    }
    
    deinit {
        debugPrint("deinit \(self)")
    }

}

