import Vapor
import HTTP

final class UserController {
    func sayHello(_ req: Request)throws -> String  {
        let stateId = try req.parameters.next(Int.self)
        
                return "City ID, \(stateId)"
    }
}
