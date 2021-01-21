//
//  SchedulerProvider.swift
//  FlickrApp
//
//  Created by Robert  Kuraj on 21/01/2021.
//

import RxSwift
import RxCocoa

public protocol SchedulerProviderProtocol {
    func comptutation() -> ImmediateSchedulerType
    func main() -> ImmediateSchedulerType
}

public class SchedulerProvider: SchedulerProviderProtocol {
    public func main() -> ImmediateSchedulerType {
        return MainScheduler.instance
    }
    
    public func comptutation() -> ImmediateSchedulerType {
        return ConcurrentDispatchQueueScheduler(queue: DispatchQueue.global(qos: .background))
    }
}
