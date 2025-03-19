// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Hummingbird

@main
struct SwiftServer {

		static func main() async throws {
			print("Server started...")
			// create router and add a single GET /hello route
			let router = Router()
			router.get("hello") { request, _ -> String in
			    return "Hello Ryan"
			}
			// create application using router
			let app = Application(
			    router: router,
			    configuration: .init(address: .hostname("127.0.0.1", port: 8080))
			)
			// run hummingbird application
			try await app.runService()

		}
}
