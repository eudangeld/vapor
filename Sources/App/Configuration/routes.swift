import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    let userController = UserController()
    let viewController = ViewController()
    
    
    router.get("getCities", Int.parameter,use:userController.sayHello)
    router.get("view",use:viewController.view)
    
    
}
