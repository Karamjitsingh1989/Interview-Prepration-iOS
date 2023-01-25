# Interview Prepration iOS

#### Memory Management
Automatic Reference Counting (ARC) is a memory management system used in Swift and Objective-C to automatically track and manage the lifetimes of objects in memory. It works by keeping a count of the number of references to an object, and when that count reaches zero, the object is deallocated and its memory is freed.
When an object is created, its reference count is set to 1. Every time a variable or constant references that object, the reference count is incremented by 1. When a variable or constant is no longer referencing the object, the reference count is decremented by 1. When the reference count reaches 0, the object is deallocated and its memory is freed.
ARC is a compile-time feature, meaning that it is handled by the compiler rather than the runtime. The compiler inserts the necessary retain, release, and autorelease calls automatically. This means that you don't have to manually insert retain and release calls, which greatly simplifies the process of memory management.

There are a few cases in which you may need to interact with ARC directly:
- Strong Reference Cycles: When two objects hold strong references to each other, they create a strong reference cycle. In this case, the reference count of the objects will never reach zero, causing a memory leak. To prevent this, you can use weak references or unowned references.
- Deinitialization: If you need to perform any cleanup before an object is deallocated, you can implement the deinit method. The deinit method is called automatically when the reference count of an object reaches zero.
- Working with Unsafe Pointers: If you are working with pointers that are not managed by ARC, you will need to manage their memory manually.
ARC is a powerful system that makes it easy to manage memory in Swift and Objective-C, but it is important to be aware of its limitations and how to work around them.

#### Multi-Threading
- DispatchQueue, DispatchWorkItem
- OperationQueue
- Semaphores
- Barrier
- RaceCondition
- Data Race
- Nested Closure
- Dispatch Group
- Actor (wait, Async)
