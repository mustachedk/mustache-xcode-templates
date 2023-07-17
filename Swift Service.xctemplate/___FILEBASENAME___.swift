protocol ___FILEBASENAME___Type {
    
    var model: Model? { get }
    
    var modelPublisher: AnyPublisher<Model?, Never> { get }
    
    func refresh() async throws
    
    func save(model: Model) async throws
    
    func clearState()
}

class ___FILEBASENAME___: ___FILEBASENAME___Type {
    
    @UserDefaultCOptional(key: "___FILEBASENAME___.model")
    var model: Model?
    
    var userPublisher: AnyPublisher<Model?, Never> {
        return self.$model
    }
    
    @LazyInjected
    private var networkService: AsyncNetworkServiceType
    
    func refresh() async throws {
        let response = try await self.networkService.getModel()
        let model = Model(response: response)
        self.model = model
    }
    
    func save(model: Model) async throws {
        let request = ModelPutRequest(model: model)
        let response = try await self.networkService.put(request: request)
        let model = Model(response: response)
        self.model = model
    }
    
    func clearState() {
        self.model = nil
    }
    
    deinit {
        debugPrint("deinit \(self)")
    }
    
}
