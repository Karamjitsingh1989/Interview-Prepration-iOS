
/*
1. Difference between main thread and background thread?
 
2. What is are serial and concurrent queue?
 
3. Pros and Cons of Serial and Concurrent queue?
 
4. What's race condition?
 

 
 ***********************************************
          GCD &  NSOperationQueue
 ***********************************************
 
1: What is queue?
   Queue perform the task(FIFO) First In First Out
   
   SERIAL QUEUE
   -- Task D -- Task C -- Task B -- Task A -->
   
   Executes task one after the other.
  
   Makes sure one task is 100% completed and then begins the next task
 
   Use when order of task execution matters
 
 
2: What is Concurrency?
   Concurrency is the process by which a computer or individual program can perform multiple tasks simultaneously
 
   CONCURRENT QUEUE
   Unpredictable order of execution
 
   Faster because there's no waiting and all task run at same time.
 
   Task B does not have to wait for Task A to complete.
 
   Use when order of task execution does not matters.
 
*******************************************
            RACE CONDITION
*******************************************
 
 Race condition occurs in a multi-threaded environment when more than one thread try to access a
 shared resource (modify, write) at the same time.
 
 Point to be noted for race condition
 It is safe if multiple threads are trying to READ a shared resource as long as they are not trying to change it
 
*/

