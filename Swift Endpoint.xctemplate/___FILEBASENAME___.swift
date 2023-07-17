
import Foundation
import MustacheFoundation
import MustacheServices

enum  ___FILEBASENAME___ {
    
    case create(ModelRequest)
    case list(page: Int, size: Int)
    case update(ModelUpdateRequest)
    case delete(ModelDeleteRequest)
        
}

extension ___FILEBASENAME___: Endpoint {
    
    var baseURL: URL {
        return Environment.backendURL
    }
    
    var method: RequestType {
        switch self {
            case .create: return .post
            case .list: return .get
            case .update: return .put
            case .delete: return .delete
        }
    }
    
    var parameters: [String: String]? {
        switch self {
            case .list(let page, let size):
                if let page, let size {
                    parameters["page"] = "\(page)"
                    parameters["size"] = "\(size)"
                }
                return parameters
            default:
                return nil
        }
    }
    
    var path: String {
        switch self {
            case .create:
                return "/entity/"
            case .list:
                return "/entity/"
            case .update(let entity):
                return "/entity/\(entity.id)"
            case .delete(let entity):
                return "/entity/\(entity.id)"
        }
    }
    
    var headers: [String: String] {
        return Environment.baseHeaders
    }
    
    var body: Any? {
        switch self {
            case .create(let request):
                return request
            case .update(let request):
                return request
            case .delete(let request):
                return request
            default:
                return nil
        }
    }
    
    var encoding: EncodingType {
        return .json
    }
    
    var authentication: Authentication {
        return .oauth
    }
    
}

extension AsyncNetworkServiceType {
    
    func create(request: ModelRequest) async throws -> ModelResponse {
        let endpoint = EntityEndpoint.create(request)
        return try await self.send(endpoint: endpoint)
    }
    
    func list(page: Int?, size: Int?) async throws -> ModelPaginatedResponse {
        let endpoint = EntityEndpoint.list(page: page, size: size)
        return try await self.send(endpoint: endpoint)
    }
    
    func update(_ model: EntityModel) async throws -> EntityResponse {
        let endpoint = EntityEndpoint.update(model)
        return try await self.send(endpoint: endpoint)
    }
    
    func delete(_ model: EntityModel) async throws -> EmptyReply {
        let endpoint = EntityEndpoint.delete(model)
        return try await self.send(endpoint: endpoint)
    }
    
}

