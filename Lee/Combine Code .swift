////
////  Combine Code .swift
////  Lee
////
////  Created by Matthew Lu on 24/4/22.
////  Copyright © 2022 Matthew Lu. All rights reserved.
////
//
//import Foundation
////Publishers
//
///* Publishers are types that can emit values over time to one or more interested parties, such as subscribers. Regardless of the internal logic of the publisher, which can be pretty much anything including math calculations, networking or handling user events, every publisher can emit multiple events of these three types:
//
//An output value of the publisher’s generic Output type.
//A successful completion.
//A completion with an error of the publisher’s Failure type.
//*/
//
////Operators
//
////Operators are methods declared on the Publisher protocol that return either the same or a new publisher. That’s very useful because you can call a bunch of operators one after the other, effectively chaining them together.
//
////Subscribers
////Finally, you arrive at the end of the subscription chain: Every subscription ends with a subscriber. Subscribers generally do “something” with the emitted output or completion events.
////
////
////The sink subscriber allows you to provide closures with your code that will receive output values and completions. From there, you can do anything your heart desires with the received events.
////The assign subscriber allows you to, without the need of custom code, bind the resulting output to some property on your data model or on a UI control to display the data directly on-screen via a key path.
//
//public func example(of description: String,
//                    action: () -> Void) {
//  print("\n——— Example of:", description, "———")
//  action()
//}
//
//example(of: "Just") {
//  // 1
//  let just = Just("Hello world!")
//  
//  // 2
//  _ = just
//    .sink(
//      receiveCompletion: {
//        print("Received completion", $0)
//      },
//      receiveValue: {
//        print("Received value", $0)
//    })
//}
//
//
//example(of: "assign(to:on:)") {
//  // 1
//  class SomeObject {
//    var value: String = "" {
//      didSet {
//        print(value)
//      }
//    }
//  }
//  
//  // 2
//  let object = SomeObject()
//  
//  // 3
//  let publisher = ["Hello", "world!"].publisher
//  
//  // 4
//  _ = publisher
//    .assign(to: \.value, on: object)
//}
//
//["A", "B", "C", "D", "E"].publisher
//  .collect()
//  .sink(receiveCompletion: { print($0) },
//        receiveValue: { print($0) })
//  .store(in: &subscriptions)
//
//
//example(of: "flatMap") {
//  // 1
//  func decode(_ codes: [Int]) -> AnyPublisher<String, Never> {
//    // 2
//    Just(
//      codes
//        .compactMap { code in
//          guard (32...255).contains(code) else { return nil }
//          return String(UnicodeScalar(code) ?? " ")
//        }
//        // 3
//        .joined()
//    )
//    // 4
//    .eraseToAnyPublisher()
//  }
//}
//
//example(of: "map") {
//  // 1
//  let formatter = NumberFormatter()
//  formatter.numberStyle = .spellOut
//  
//  // 2
//  [123, 4, 56].publisher
//    // 3
//    .map {
//      formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
//    }
//    .sink(receiveValue: { print($0) })
//    .store(in: &subscriptions)
//}
//
//
//// 5
//[72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33]
//  .publisher
//  .collect()
//  // 6
//  .flatMap(decode)
//  // 7
//  .sink(receiveValue: { print($0) })
//  .store(in: &subscriptions)
//
//
//example(of: "filter") {
//  // 1
//  let numbers = (1...10).publisher
//  
//  // 2
//  numbers
//    .filter { $0.isMultiple(of: 3) }
//    .sink(receiveValue: { n in
//      print("\(n) is a multiple of 3!")
//    })
//    .store(in: &subscriptions)
//}
//
//
//example(of: "removeDuplicates") {
//  // 1
//  let words = "hey hey there! want to listen to mister mister ?"
//                  .components(separatedBy: " ")
//                  .publisher
//  // 2
//  words
//    .removeDuplicates()
//    .sink(receiveValue: { print($0) })
//    .store(in: &subscriptions)
//}
//
//example(of: "compactMap") {
//  // 1
//  let strings = ["a", "1.24", "3",
//                 "def", "45", "0.23"].publisher
//  
//  // 2
//  strings
//    .compactMap { Float($0) }
//    .sink(receiveValue: {
//      // 3
//      print($0)
//    })
//    .store(in: &subscriptions)
//}
//
//example(of: "first(where:)") {
//  // 1
//  let numbers = (1...9).publisher
//  
//  // 2
//  numbers
//    .first(where: { $0 % 2 == 0 })
//    .sink(receiveCompletion: { print("Completed with: \($0)") },
//          receiveValue: { print($0) })
//    .store(in: &subscriptions)
//}
//
//example(of: "last(where:)") {
//  // 1
//  let numbers = (1...9).publisher
//  
//  // 2
//  numbers
//    .last(where: { $0 % 2 == 0 })
//    .sink(receiveCompletion: { print("Completed with: \($0)") },
//          receiveValue: { print($0) })
//    .store(in: &subscriptions)
//
//
//    example(of: "last(where:)") {
//      let numbers = PassthroughSubject<Int, Never>()
//      
//      numbers
//        .last(where: { $0 % 2 == 0 })
//        .sink(receiveCompletion: { print("Completed with: \($0)") },
//              receiveValue: { print($0) })
//        .store(in: &subscriptions)
//      
//      numbers.send(1)
//      numbers.send(2)
//      numbers.send(3)
//      numbers.send(4)
//      numbers.send(5)
//    }
//
//    example(of: "dropFirst") {
//      // 1
//      let numbers = (1...10).publisher
//      
//      // 2
//      numbers
//        .dropFirst(8)
//        .sink(receiveValue: { print($0) })
//        .store(in: &subscriptions)
//    }
//    
//    example(of: "drop(while:)") {
//      // 1
//      let numbers = (1...10).publisher
//      
//      // 2
//      numbers
//        .drop(while: { $0 % 5 != 0 })
//        .sink(receiveValue: { print($0) })
//        .store(in: &subscriptions)
//    }
//    
//    example(of: "prepend(Publisher)") {
//      // 1
//      let publisher1 = [3, 4].publisher
//      let publisher2 = [1, 2].publisher
//      
//      // 2
//      publisher1
//        .prepend(publisher2)
//        .sink(receiveValue: { print($0) })
//        .store(in: &subscriptions)
//    }
//
//    example(of: "append(Output...)") {
//      // 1
//      let publisher = [1].publisher
//
//      // 2
//      publisher
//        .append(2, 3)
//        .append(4)
//        .sink(receiveValue: { print($0) })
//        .store(in: &subscriptions)
//    }
//
//    example(of: "min") {
//      // 1
//      let publisher = [1, -50, 246, 0].publisher
//
//      // 2
//      publisher
//        .print("publisher")
//        .min()
//        .sink(receiveValue: { print("Lowest value is \($0)") })
//        .store(in: &subscriptions)
//    }
//    
//    
//    // 1
//    let subject = PassthroughSubject<String, Never>()
//
//    // 2
//    let debounced = subject
//      .debounce(for: .seconds(1.0), scheduler: DispatchQueue.main)
//      // 3
//      .share()
//    
//    let subscription2 = debounced
//      .sink { string in
//        print("+\(deltaTime)s: Debounced emitted: \(string)")
//      }
//
//
//    let throttleDelay = 1.0
//
//    // 1
//    let subject = PassthroughSubject<String, Never>()
//
//    // 2
//    let throttled = subject
//      .throttle(for: .seconds(throttleDelay), scheduler: DispatchQueue.main, latest: false)
//      // 3
//      .share()
//
//    let subscription2 = throttled
//      .sink { string in
//        print("+\(deltaTime)s: Throttled emitted: \(string)")
//      }
//
//    example(of: "allSatisfy") {
//      // 1
//      let publisher = stride(from: 0, to: 5, by: 2).publisher
//      
//      // 2
//      publisher
//        .print("publisher")
//        .allSatisfy { $0 % 2 == 0 }
//        .sink(receiveValue: { allEven in
//          print(allEven ? "All numbers are even"
//                        : "Something is odd...")
//        })
//        .store(in: &subscriptions)
//    }
//
//
//    let subscription = URLSession.shared
//      .dataTaskPublisher(for: url)
//      .map(\.data)
//      .decode(type: MyType.self, decoder: JSONDecoder())
//      .sink(receiveCompletion: { completion in
//        if case .failure(let err) = completion {
//          print("Retrieving data failed with error \(err)")
//        }
//      }, receiveValue: { object in
//        print("Retrieved object \(object)")
//      })
//
//
//    let subscription = Timer
//      .publish(every: 1.0, on: .main, in: .common)
//      .autoconnect()
//      .scan(0) { counter, _ in counter + 1 }
//      .sink { counter in
//        print("Counter is \(counter)")
//      }
