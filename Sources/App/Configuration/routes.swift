import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    router.get { req in
        return "Vapor on Swift"
    }
    
//    let userController = UserController()
    let viewController = ViewController()
    
    router.post("users") { req -> Future<Response> in
        return try req.content.decode(User.self).flatMap { user in
            return user.save(on: req).map { _ in
                return req.redirect(to: "users")
            }
        }
    }
    
    
    router.get("users") { req -> Future<View> in
        return User.query(on: req).all().flatMap { users in
            let data = ["userlist": users]
            return try req.view().render("userview", data)
        }
    }
    router.get("view",use:viewController.view)
    
    
    
}
