//
//  ViewController.swift
//  FindWithString
//
//  Created by Oleh Blef on 9/20/19.
//  Copyright © 2019 Oleh Podluzhnyi. All rights reserved.
//

import UIKit
import ReactiveSwift
import ReactiveCocoa
import Foundation

final class FindViewController<Model: FindPresentationModelProtocol>:
                                BasePresentationModelViewController<Model, FindView>,
                                UITableViewDelegate,
                                UITableViewDataSource,
                                UITextFieldDelegate,
                                Cashable {
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configUI()
    }
    
    // MARK - Private methods
    
    private func configUI() {
        self.rootView?.tableView.delegate = self
        self.rootView?.tableView.dataSource = self
        self.rootView?.findTextField.delegate = self
        
        self.rootView?.tableView.register(FindTableViewCell.self, forCellReuseIdentifier: toString(FindTableViewCell.self))
        
        self.rootView?.findTextField.reactive.continuousTextValues.observeValues { [weak self] text in
            self?.viewData.onUpdateFindText?(text)
        }
    }
    
    private func getAlert() {
        let alertController = UIAlertController(title: "Sorry", message: "We don't have this image", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewData.cashArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: toString(FindTableViewCell.self), for: indexPath) as! FindTableViewCell
        let item = self.viewData.cashArray?[indexPath.row]
        item.do {
            cell.render(viewData: $0)
        }
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == self.rootView?.findTextField {
            let accesKey = "9a471a89261b9a66742a4cad58e65028a926e04fe462b60c754827fa4196abfe"
            let secretKey = "800ac52a5eea1185b24036154a24cdc2a7f0dcb97781c61766f569e3dfb0a7ba"
 
            if let url = URL(string: "https://api.unsplash.com/search/photos?query=\(textField.text!)") {
                
                var request = URLRequest(url: url)
                request.httpMethod = "GET"
                
                request.setValue("Client-ID \(accesKey)", forHTTPHeaderField: "Authorization")
                
                let task = URLSession.shared.dataTask(with: request) { data, response, error in
                    
                    if let err = error {
                        print("Error: \(err)")
                        return
                    }
                    
                    if let http = response as? HTTPURLResponse {
                        if http.statusCode == 200 {
                            data.do {
                                let newValue = try? JSONDecoder().decode(Unsplash.self, from: $0)
                                let imageString = newValue?.results.first?.urls.small
                                DispatchQueue.global().async {
                                    imageString.do {
                                        let imUrl: URL = URL(string: $0)!
                                        if let data = try? Data(contentsOf: imUrl) {
                                            if let image = UIImage(data: data) {
                                                DispatchQueue.main.async { [weak self] in
                                                    self?.viewData.addCash?(Cash(image, textField.text ?? ""))
                                                    textField.resignFirstResponder()
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        } else {
                            self.getAlert()
                        }
                    }
                }
                task.resume()
            }
        }
        return true
    }
}

