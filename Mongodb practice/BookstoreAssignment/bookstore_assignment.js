use BookStoreDB

db.createCollection("books")
db.createCollection("customers")
db.createCollection("orders")

db.books.insertMany([
  { bookId: 101, title: "Mastering Java", author: "James Carter", category: "Programming", price: 850, stock: 20, publishedYear: 2022, rating: 4.5, isAvailable: true, tags: ["Java","Backend","OOP"], publisher: {name: "TechBooks", city: "Bangalore"} },
  { bookId: 102, title: "Python Basics", author: "Linda White", category: "Programming", price: 600, stock: 15, publishedYear: 2021, rating: 4.2, isAvailable: true, tags: ["Python","Beginner"], publisher: {name: "CodePress", city: "Chennai"} },
  { bookId: 103, title: "Database Essentials", author: "Mark Evans", category: "Database", price: 750, stock: 10, publishedYear: 2020, rating: 4.3, isAvailable: true, tags: ["SQL","Database"], publisher: {name: "DataPub", city: "Delhi"} },
  { bookId: 104, title: "Web Development Guide", author: "Sara Khan", category: "Web", price: 500, stock: 8, publishedYear: 2023, rating: 4.7, isAvailable: true, tags: ["HTML","CSS","JavaScript"], publisher: {name: "WebWorks", city: "Mumbai"} },
  { bookId: 105, title: "React for Beginners", author: "John Doe", category: "Web", price: 650, stock: 5, publishedYear: 2022, rating: 4.1, isAvailable: true, tags: ["React","Frontend"], publisher: {name: "Frontline", city: "Bangalore"} },
  { bookId: 106, title: "Machine Learning 101", author: "Alice Brown", category: "AI", price: 1200, stock: 7, publishedYear: 2021, rating: 4.6, isAvailable: true, tags: ["AI","ML","Beginner"], publisher: {name: "AIMedia", city: "Hyderabad"} },
  { bookId: 107, title: "Data Structures", author: "David Lee", category: "Programming", price: 800, stock: 12, publishedYear: 2019, rating: 4.4, isAvailable: true, tags: ["Data Structures","Algorithms"], publisher: {name: "TechBooks", city: "Bangalore"} },
  { bookId: 108, title: "Cyber Security Basics", author: "Nancy Drew", category: "Security", price: 700, stock: 6, publishedYear: 2020, rating: 4.2, isAvailable: true, tags: ["Cybersecurity","Network"], publisher: {name: "SecurePub", city: "Chennai"} },
  { bookId: 109, title: "Advanced Java", author: "James Carter", category: "Programming", price: 900, stock: 3, publishedYear: 2021, rating: 4.8, isAvailable: true, tags: ["Java","OOP","Advanced"], publisher: {name: "TechBooks", city: "Bangalore"} },
  { bookId: 110, title: "NoSQL for Beginners", author: "Emily Clark", category: "Database", price: 550, stock: 9, publishedYear: 2022, rating: 4.0, isAvailable: true, tags: ["MongoDB","NoSQL"], publisher: {name: "DataPub", city: "Delhi"} }
])

db.customers.insertMany([
  { customerId: 201, name: "Rahul Sharma", email: "rahul@gmail.com", city: "Chennai", age: 28, membershipType: "Silver", isActive: true, interests: ["Programming","AI"] },
  { customerId: 202, name: "Anjali Mehta", email: "anjali@gmail.com", city: "Bangalore", age: 25, membershipType: "Gold", isActive: true, interests: ["Web","React"] },
  { customerId: 203, name: "Karthik R", email: "karthik@yahoo.com", city: "Chennai", age: 30, membershipType: "Silver", isActive: false, interests: ["Database","SQL"] },
  { customerId: 204, name: "Priya Singh", email: "priya@gmail.com", city: "Delhi", age: 27, membershipType: "Gold", isActive: true, interests: ["AI","ML"] },
  { customerId: 205, name: "Suresh Kumar", email: "suresh@hotmail.com", city: "Mumbai", age: 32, membershipType: "Silver", isActive: true, interests: ["Security","Networking"] },
  { customerId: 206, name: "Meena Patel", email: "meena@gmail.com", city: "Bangalore", age: 29, membershipType: "Platinum", isActive: true, interests: ["Programming","Python"] },
  { customerId: 207, name: "Arjun Das", email: "arjun@gmail.com", city: "Chennai", age: 24, membershipType: "Silver", isActive: true, interests: ["MongoDB","Database"] },
  { customerId: 208, name: "Neha Jain", email: "neha@gmail.com", city: "Hyderabad", age: 26, membershipType: "Gold", isActive: true, interests: ["Web","JavaScript"] }
])

db.orders.insertMany([
  { orderId: 301, customerId: 201, bookId: 101, quantity: 1, totalAmount: 850, orderDate: new Date("2026-03-01"), paymentMode: "UPI", status: "Delivered" },
  { orderId: 302, customerId: 202, bookId: 102, quantity: 2, totalAmount: 1200, orderDate: new Date("2026-03-02"), paymentMode: "Card", status: "Pending" },
  { orderId: 303, customerId: 203, bookId: 103, quantity: 1, totalAmount: 750, orderDate: new Date("2026-03-03"), paymentMode: "UPI", status: "Cancelled" },
  { orderId: 304, customerId: 204, bookId: 104, quantity: 1, totalAmount: 500, orderDate: new Date("2026-03-04"), paymentMode: "Cash", status: "Delivered" },
  { orderId: 305, customerId: 205, bookId: 105, quantity: 1, totalAmount: 650, orderDate: new Date("2026-03-05"), paymentMode: "UPI", status: "Pending" },
  { orderId: 306, customerId: 206, bookId: 106, quantity: 1, totalAmount: 1200, orderDate: new Date("2026-03-06"), paymentMode: "Card", status: "Delivered" },
  { orderId: 307, customerId: 207, bookId: 107, quantity: 3, totalAmount: 2400, orderDate: new Date("2026-03-07"), paymentMode: "UPI", status: "Pending" },
  { orderId: 308, customerId: 208, bookId: 108, quantity: 1, totalAmount: 700, orderDate: new Date("2026-03-08"), paymentMode: "Cash", status: "Cancelled" },
  { orderId: 309, customerId: 201, bookId: 109, quantity: 1, totalAmount: 900, orderDate: new Date("2026-03-09"), paymentMode: "UPI", status: "Delivered" },
  { orderId: 310, customerId: 202, bookId: 110, quantity: 2, totalAmount: 1100, orderDate: new Date("2026-03-10"), paymentMode: "Card", status: "Pending" }
])

db.books.insertOne({ bookId: 111, title: "Angular Advanced", author: "Ravi Kumar", category: "Web", price: 700, stock: 6, publishedYear: 2023, rating: 4.3, isAvailable: true, tags: ["Angular","Frontend"], publisher: {name: "Frontline", city: "Bangalore"} })
db.customers.insertOne({ customerId: 209, name: "Vikram Seth", email: "vikram@gmail.com", city: "Pune", age: 31, membershipType: "Silver", isActive: true, interests: ["Programming","AI"] })
db.orders.insertOne({ orderId: 311, customerId: 209, bookId: 111, quantity: 1, totalAmount: 700, orderDate: new Date("2026-03-11"), paymentMode: "UPI", status: "Pending" })

db.books.find()
db.customers.find()
db.orders.find()
db.books.findOne({ title: "Mastering Java" })
db.customers.find({ city: "Chennai" })
db.orders.find({ paymentMode: "UPI" })

db.books.updateOne({ bookId: 101 }, { $set: { price: 900 } })
db.books.updateOne({ bookId: 102 }, { $inc: { stock: -2 } })
db.customers.updateOne({ customerId: 201 }, { $set: { membershipType: "Gold" } })
db.orders.updateOne({ orderId: 302 }, { $set: { status: "Delivered" } })

db.books.deleteOne({ stock: 0 })
db.customers.deleteOne({ isActive: false })
db.orders.deleteMany({ status: "Cancelled" })

db.books.find({ category: { $eq: "Programming" } })
db.books.find({ category: { $ne: "Programming" } })
db.books.find({ price: { $gt: 700 } })
db.books.find({ rating: { $gte: 4.5 } })
db.books.find({ stock: { $lt: 10 } })
db.books.find({ publishedYear: { $lte: 2020 } })
db.books.find({ category: { $in: ["Programming","Database"] } })
db.books.find({ category: { $nin: ["Programming","Database"] } })

db.books.find({ $and: [ { category: "Programming" }, { price: { $gt: 500 } } ] })
db.books.find({ $or: [ { stock: { $lt: 5 } }, { rating: { $gt: 4.7 } } ] })
db.books.find({ price: { $not: { $gt: 1000 } } })
db.books.find({ $nor: [ { category: "Programming" }, { rating: { $gt: 4.5 } } ] })

db.books.find({ "publisher.city": { $exists: true } })
db.books.find({ price: { $type: "double" } })

db.books.find({ tags: { $all: ["Java","OOP"] } })
db.customers.find({ interests: { $size: 2 } })
db.books.find({ tags: { $elemMatch: { $eq: "Python" } } })
db.customers.find({ interests: "MongoDB" })

db.books.find({ title: { $regex: /^M/ } })
db.customers.find({ email: { $regex: /gmail\.com$/ } })
db.books.find({ $expr: { $gt: ["$price","$stock"] } })

db.books.find({}, { title: 1, author: 1, price: 1 })
db.customers.find({}, { name: 1, city: 1, _id: 0 })
db.orders.find({}, { orderId: 1, customerId: 1, totalAmount: 1 })

db.books.find().sort({ price: 1 })
db.books.find().sort({ rating: -1 })
db.customers.find().sort({ age: -1 })
db.orders.find().sort({ orderDate: -1 })