import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }

    app.get("myTasks") { req ->[Task] in
       
        return [Task( objective: "first task" , created_at: Date()) , Task(objective: "seconed task" , created_at: Date())]
    }
    
    app.post("myTasks") { req -> Task in
        let task = try? req.content.decode(Task.self)
        return task!
    }
}

struct Task : Content {
    let objective : String
    let created_at : Date
}
