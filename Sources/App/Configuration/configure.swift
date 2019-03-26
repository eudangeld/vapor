import FluentSQLite
import Vapor
import Leaf

public func configure(
    _ config: inout Config,
    _ env: inout Environment,
    _ services: inout Services
    ) throws {
    
    let router = EngineRouter.default()
    try routes(router)
    services.register(router, as: Router.self)
    let leafProvider = LeafProvider()    // added
    try services.register(leafProvider)  // added
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)
}
