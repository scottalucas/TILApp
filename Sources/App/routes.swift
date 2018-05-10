import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    router.post("api", "acronyms") { req -> Future<Acronym> in
    // 2
    return try req.content.decode(Acronym.self)
        .flatMap(to: Acronym.self) { acronym in
            // 3
            let a = acronym.save(on: req)
            return a
        }
    }

}
