//
//  HealthService.swift
//  walkapp
//
//  Created by Dason Tiovino on 17/06/24.
//

import HealthKit

class HealthService{
    var store: HKHealthStore?
    
    init() {
        if HKHealthStore.isHealthDataAvailable(){
            store = HKHealthStore()
        }
    }
    
    func requestAuthorization(completion: @escaping (Bool) -> Void){
        guard let store = self.store else{
            completion(false)
            return
        }
        
        let stepType = HKQuantityType(.stepCount)
        let typesToShare: Set<HKSampleType> = []
        let typesToRead: Set<HKObjectType> = [stepType]
        
        store.requestAuthorization(toShare: typesToShare, read: typesToRead){ (success, error) in
            completion(success)
        }
    }
    
    func fetchStepCount(for date: Date? = Date(), completion: @escaping (Double) -> Void) {
        guard let store = self.store else {
            completion(0.0)
            return
        }
        
        let stepType = HKQuantityType.quantityType(forIdentifier: .stepCount)!
        let start = Calendar.current.startOfDay(for: date!)
        let end = Calendar.current.date(byAdding: .day, value: 1, to: start)!
        
        let predicate = HKQuery.predicateForSamples(withStart: start, end: end, options: .strictStartDate)
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
            var stepCount = 0.0
            
            if let result = result, let sum = result.sumQuantity() {
                stepCount = sum.doubleValue(for: HKUnit.count())
            }
            
            DispatchQueue.main.async {
                completion(stepCount)
            }
        }
        
        store.execute(query)
    }
    
    func fetchDistance(for date: Date? = Date(), completion: @escaping (Double) -> Void) {
        guard let store = self.store else {
            completion(0.0)
            return
        }
        
        let stepType = HKQuantityType.quantityType(forIdentifier: .distanceWalkingRunning)!
        let start = Calendar.current.startOfDay(for: date!)
        let end = Calendar.current.date(byAdding: .day, value: 1, to: start)!
        
        let predicate = HKQuery.predicateForSamples(withStart: start, end: end, options: .strictStartDate)
        let query = HKStatisticsQuery(quantityType: stepType, quantitySamplePredicate: predicate, options: .cumulativeSum) { _, result, _ in
            var stepCount = 0.0
            
            if let result = result, let sum = result.sumQuantity() {
                stepCount = sum.doubleValue(for: HKUnit.count())
            }
            
            DispatchQueue.main.async {
                completion(stepCount)
            }
        }
        
        store.execute(query)
    }
}
