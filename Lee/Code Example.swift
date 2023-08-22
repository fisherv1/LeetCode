////
////  Code Example.swift
////  Lee
////
////  Created by Matthew Lu on 29/4/22.
////  Copyright © 2022 Matthew Lu. All rights reserved.
////
//
//import Foundation
//
//// Decode and encode
//let ben = Employee(firstName: "Ben", LastName: "Stoot", jobTitle: "Front Desk", phoneNumber: "12334")
//
//let jsonEncoader = JSONEncoder()
//if let jsonData = try? jsonEncoader.encode(ben), let jsonString = String(data: jsonData, encoding: .utf8) {
//    print(jsonString)
//}
//
//let jsonDecoader = JSONDecoder()
//
//let employeeData = Data("{\"firstName\":\"Ben\",\"LastName\":\"Stoot\",\"jobTitle\":\"Front Desk\",\"phoneNumber\":\"12334\"}".utf8)
//if let employee = try? jsonDecoader.decode(Employee.self, from: employeeData
//) {
//    print(employee)
//}
//
//
//
//// Network call
//
//struct PhotoInfo: Codable {
//    var title: String
//    var description: String
//    var url: URL
//    var copyright: String?
// 
//    enum CodingKeys: String, CodingKey {
//        case title
//        case description = "explanation"
//        case url
//        case copyright
//    }
//}
//
//enum PhotoInfoError: Error, LocalizedError {
//    case itemNotFound
//}
//
//@available(iOS 15.0, *)
//func fetchPhotoInfo() async throws -> PhotoInfo {
//    var urlComponents = URLComponents(string:
//       "https://api.nasa.gov/planetary/apod")!
//    urlComponents.queryItems = [
//        "api_key": "DEMO_KEY"
//    ].map { URLQueryItem(name: $0.key, value: $0.value) }
// 
//    let (data, response) = try await URLSession.shared.data(from:
//       urlComponents.url!)
// 
//    guard let httpResponse = response as? HTTPURLResponse,
//          httpResponse.statusCode == 200 else {
//        throw PhotoInfoError.itemNotFound
//    }
// 
//    let jsonDecoder = JSONDecoder()
//    let photoInfo = try jsonDecoder.decode(PhotoInfo.self, from: data)
//    return(photoInfo)
//}
//
//@available(iOS 15.0, *)
//func task() {
//    Task {
//       do {
//        
//               let photoInfo = try await fetchPhotoInfo()
//           print("Successfully fetched PhotoInfo: \(photoInfo)")
//       } catch {
//           print("Fetch PhotoInfo failed with error: \(error)")
//       }
//   }
//}
//
//
//// Set Constraint
//
//
//private func setupView() {
//    
////        backgroundColor = .systemGray5
////
////        addSubview(titleLabel)
////        titleLabel.translatesAutoresizingMaskIntoConstraints =
////           false
////        NSLayoutConstraint.activate([
////            titleLabel.topAnchor.constraint(equalTo: topAnchor,
////               constant: 2),
////            titleLabel.trailingAnchor.constraint(equalTo:
////               trailingAnchor, constant: -15),
////            titleLabel.bottomAnchor.constraint(equalTo:
////               bottomAnchor, constant: -2),
////            titleLabel.leadingAnchor.constraint(equalTo:
////               leadingAnchor, constant: 15),
////        ])
//    }
//
//
//// Switch statement
//
//func switchStatement() {
//    let someCharacter: Character = "z"
//    switch someCharacter {
//    case "a":
//        print("The first letter of the alphabet")
//    case "z":
//        print("The last letter of the alphabet")
//    default:
//        print("Some other character")
//    }
//}
//

import Foundation

// 质数的定义 在大于1的自然数中，除了1和它本身以外不再有其他因数的自然数
    // 对于每个数x，在[2,x-1]的区间内，如果存在y是x的因数，那么x就不是质数，否则为质数
    // 如果存在y是x的因数（即x%y==0），那么x/y也是x的因数，因而我们只需校验y或者x/y即可，每次我们校验y和y/x中的较小值，那么y<=x/y,则y的范围为[2,√x]
    


 func isPrimes(_ n:Int) -> Bool {
    var i = 2
    let end = Int(sqrt(Double(n)))
    
    while i<=end {
        if n%i == 0 {
            return false
        }
        i+=1
    }
    
    return true
}

