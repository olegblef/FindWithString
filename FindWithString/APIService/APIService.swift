//
//  APIService.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/22/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit

class APIService {
    
    // MARK: - Typealiases
    
    typealias VoidCompletion = (() -> ())?
    typealias ImageCompletion = ((String) -> ())?
    
    // MARK: - Private properties
    
    private let accesKey = "9a471a89261b9a66742a4cad58e65028a926e04fe462b60c754827fa4196abfe"
    private let secretKey = "800ac52a5eea1185b24036154a24cdc2a7f0dcb97781c61766f569e3dfb0a7ba"
    
    // MARK: - Internal methods
    
    func getImage(text: String, completion: ImageCompletion, alert: VoidCompletion) {
        
        if let url = URL(string: "https://api.unsplash.com/search/photos?query=\(text))") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.setValue("Client-ID \(self.accesKey)", forHTTPHeaderField: "Authorization")
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let err = error {
                    print("Error: \(err)")
                    return
                }
                
                self.responsing(response, data, completion: completion, alert: alert)
            }
            task.resume()
        }
    }
    
      // MARK - Private methods
    
    private func responsing(_ response: URLResponse?, _ data: Data?, completion: ImageCompletion, alert: VoidCompletion) {
        if let http = response as? HTTPURLResponse {
            if http.statusCode == 200 {
                data.do {
                    let newValue = try? JSONDecoder().decode(Unsplash.self, from: $0)
                    let imageString = newValue?.results.randomElement()?.urls.small
                    DispatchQueue.global().async {
                        imageString.do { requestUrl in
                            DispatchQueue.main.async {
                                completion?(requestUrl)
                            }
                        }
                    }
                }
            } else {
                alert?()
            }
        }
    }
}
