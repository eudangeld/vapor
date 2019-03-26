import FluentSQLite
import Vapor

/// Called before your application initializes.
public func configure(_ config: inout Config, _ env: inout Environment, _ services: inout Services) throws {

    // Register routes to the router
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)

    // Register middleware
    var middlewares = MiddlewareConfig() // Create _empty_ middleware config
    // middlewares.use(FileMiddleware.self) // Serves files from `Public/` directory
    middlewares.use(ErrorMiddleware.self) // Catches errors and converts to HTTP response
    services.register(middlewares)
    
    
    let wss = NIOWebSocketServer.default()
    
    wss.get("qualquercoisa", String.parameter) { ws, req in
        let name = try req.parameters.next(String.self)
        ws.send("Welcome, \(name)!")
    }
    services.register(wss, as: WebSocketServer.self)
}
