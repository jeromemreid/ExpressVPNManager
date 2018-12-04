import Vapor
import Leaf



/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    //  "Hello, Leaf!" example
    
    
    router.get("hello") { req -> Future<View> in
        return try req.view().render("hello", ["name": "Leaf"])
    }
    
    router.get("status") { req -> String in
        
        let expressVPN = SocketPort (remoteWithTCPPort: 4201, host: "192.168.1.222")
        expressVPN?.send(before: Date(timeIntervalSinceNow: 1000), components: ["expressvpn status"],  from: nil, reserved: 100)
        let status = "Connected"
        return "status is \(status)"
    }

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
