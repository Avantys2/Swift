//
//  FilesStore.swift
//  FileOperations
//
//  Created by Viktor Siedov on 12/2/18.
//  Copyright © 2018 Viktor Siedov. All rights reserved.
//

import Foundation

typealias BlockCompletion = (_ data: String?) -> Void
typealias AppendProgress = (_ : ()) -> Void
typealias AppendCompletion = BlockCompletion
typealias RemoveCompletion = BlockCompletion

class FilesStore {
    private let writeQueue = OperationQueue()
    private let removeQueue = OperationQueue()
    
    private var objects = [String]()
    
    //public var maxStoreCount: Int
    public var valueArray: [String] {
        return objects
    }
    
    public var count: Int {
        return objects.count
    }
    
    init () {
        
        writeQueue.maxConcurrentOperationCount = 1
        removeQueue.maxConcurrentOperationCount = 1
        //maxStoreCount = maxCount
        
        writeQueue.qualityOfService = .background
        removeQueue.qualityOfService = .background
    }
    
    private func addOperationWrite(operation: BlockOperation){
        
        for removeOperation in removeQueue.operations {
            removeOperation.addDependency(operation)
        }
        
        writeQueue.addOperation(operation)
    }
    
    private func addOperationRemove(operation: BlockOperation){
        
        for writeOperation in writeQueue.operations {
            operation.addDependency(writeOperation)
        }
        
        removeQueue.addOperation(operation)
    }
    
    public func cancelOperations (queue: OperationQueue){
        for operation in queue.operations.reversed() {
            operation.cancel()
        }
    }
    
    public func append(index: Int, progress: @escaping AppendProgress ,completion: @escaping AppendCompletion) {
        var dat: String?
        let operation = BlockOperation.init {
            sleep(1)
            dat = "write object \(index)"
            //print("write object \(index)")
            self.objects.append("object\(index)")
            progress(())
        }
        
        operation.completionBlock = {
            //print("append completionBlock")
            completion(dat)
        }
        
        addOperationWrite(operation: operation)
    }
    
    public func removeFirst(completion: @escaping RemoveCompletion) {
        var dat: String?
        let operation = BlockOperation.init {
             sleep(1) //test
            //print("delete \(self.objects[0])")
            dat = self.objects[0]
            self.objects.removeFirst()
        }
        
        operation.completionBlock = {
            //print("removeFirst completionBlock \(self.objects.count)")
            completion(dat)
        }
        
        addOperationRemove(operation: operation)
    }
}
