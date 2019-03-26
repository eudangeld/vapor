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
    let leafProvider = LeafProvider()
    try services.register(leafProvider)
    try services.register(FluentSQLiteProvider())
    
    config.prefer(LeafRenderer.self, for: ViewRenderer.self)
    
    var dataBases = DatabasesConfig()
    try dataBases.add(database:SQLiteDatabase(storage: .memory), as: .sqlite)
    services.register(dataBases)
    
    var migration = MigrationConfig()
    migration.add(model:User.self,database: .sqlite)
    services.register(migration)
}
