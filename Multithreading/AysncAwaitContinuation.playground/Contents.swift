import UIKit


struct RequestURLS {
    static let baseURL = "https://rickandmortyapi.com/api"
}


struct ResourseURLS: Codable {
    var characters: String?
    var locations: String?
    var episodes: String?
}

enum APIError: Error {
    case badURL
    case noData
    case decodingError
    case unkown
}


protocol RequestProtocol {
    func getRequest<T:Codable>(url: String, type: T.Type, completion:@escaping(Result<T, APIError>)->Void)
}

class APIRequest: RequestProtocol {
    
    func getRequest<T>(url: String, type: T.Type, completion: @escaping (Result<T, APIError>) -> Void) where T : Decodable, T : Encodable {
        
        guard let url = URL(string: url) else {
            completion(.failure(.badURL))
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                completion(.failure(.noData))
                return
            }
          let responseObject = try? JSONDecoder().decode(type.self, from: data)
            
            if let object = responseObject {
                completion(.success(object))
            }
        }.resume()
    }
}

func getResourceURLS() async throws -> ResourseURLS {
    
    return try await withCheckedThrowingContinuation({ continuation in
        APIRequest().getRequest(url: RequestURLS.baseURL, type: ResourseURLS.self) { result in
            switch result {
            case .success(let resourceObj):
                continuation.resume(returning: resourceObj)
            case .failure(let error):
                continuation.resume(throwing:error)
            }
        }
    })
}

Task {
    do {
        let resourceUrl = try await getResourceURLS()
        print(resourceUrl)
    } catch {
        throw error
    }
}

