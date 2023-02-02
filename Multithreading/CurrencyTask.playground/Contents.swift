import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
/*
 MARK: APIError: Handling error
 */

enum APIError: Error {
    case badURL
    case noData
    case decodingError
    case unknownError
}

/*
  MARK: URL Constants
 */
struct Constants {
    struct urls{
        static func news() -> URL?{
            guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=2cdd98057f3c4d3f9bf52b92c3871f46") else {
                return nil
            }
            return url
        }
    }
}

// MARK: Response Model


// MARK: - NewsStatus
struct NewsStatus: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable {
    let source: Source
    let author: String?
    let title: String
    let articleDescription: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Decodable{
    let id: String?
    let name: String
}


// MARK: Network Services Protocol

 var count = 1
protocol APIRequestProtocol {
    func apiRequest<T>(with url:URL, andModelObjectType type: T.Type) async throws -> Result<T, Error> where T: Decodable
    func handleResult(withResult result: Result<Data, Error>) async throws -> (Data?, Error?)
}

protocol DataRequestProtocol {
    func fetchData(with Url:URL) async throws -> Result<Data, Error>
}

protocol ResposneModelProtocol {
    func fetchResponse<T>(with data:Data, andResponseModelType type:T.Type) async throws -> Result<T, Error> where T: Decodable
}
/*
 Composition Protocol
 */
protocol APIResultProtocol: DataRequestProtocol, ResposneModelProtocol {}


// MARK: Network Serivce Class

class NetworkManager: APIRequestProtocol {
  
    
    private let apiHandler: DataRequestProtocol
    private let responseHandler: ResponseHandler
    
    init(apiHandler: DataRequestProtocol = APIHandler(), responseHandler: ResponseHandler = ResponseHandler()) {
        self.apiHandler = apiHandler
        self.responseHandler = responseHandler
    }
   
    func apiRequest<T>(with url: URL, andModelObjectType type: T.Type) async throws -> Result<T, Error> where T : Decodable {
        
        guard let result = try? await apiHandler.fetchData(with: url) else {
           throw APIError.badURL
        }
        
        let (data, error) = try await self.handleResult(withResult: result)
        
        guard let data = data, error == nil else {
            return .failure(error!)
        }
        
        guard let result = try? await responseHandler.fetchResponse(with: data, andResponseModelType: type.self) else {
            throw APIError.decodingError
        }
        return result
    }
    
    func handleResult(withResult result: Result<Data, Error>) async throws -> (Data?, Error?) {
        switch result {
        case .success(let data):
            return (data, nil)
        case .failure(let error):
            return (nil, error)
        }
    }
    
}

// MARK: API Handler

class APIHandler: DataRequestProtocol {
  
    func fetchData(with Url: URL) async throws -> Result<Data, Error> {
        
        let (data,_) = try await URLSession.shared.data(from: Url)
        return .success(data)
    }
    
    
}

// MARK: Response Handler

class ResponseHandler: ResposneModelProtocol {
    
    func fetchResponse<T>(with data: Data, andResponseModelType type: T.Type) async throws -> Result<T, Error> where T : Decodable {
        
        guard let modelObject = try? JSONDecoder().decode(type.self, from: data) else {
            return .failure(APIError.decodingError)
        }
        return .success(modelObject)
    }
}

// MARK: Implementation

func main() async {
    let service = NetworkManager()
    
    guard let url =  Constants.urls.news() else {
        return
    }
    let result = try? await NetworkManager().apiRequest(with: url, andModelObjectType: NewsStatus.self)
    count += 1 // for testing purpose
    do {
        let result = try? await service.apiRequest(with: url, andModelObjectType: NewsStatus.self)
        switch result {
        case .success(let creditScore):
            print(creditScore)
            print(count)
           
        case .failure(let error):
            print(error)
        case .none:
            print("Unknown case")
            break
        }
    }
}

Task {
    await main()
}



// MARK: Perform Task sequence
/*
Task {
    for _ in 1...5 {
        do {
            try Task.checkCancellation()
            await main()
        }
        catch {
            print("Error Message:\(error)")
        }
    }
}
 */

// MARK: Currency using Async group
/*
func groupCurrency() async throws {
    
    try await withThrowingTaskGroup(of: Void.self, body: { group in
        for _ in 1...5{
            group.async {
               
                await main()
            }
        }
    })
}


Task {
   try await groupCurrency()
}
*/
