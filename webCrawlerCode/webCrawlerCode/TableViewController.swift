//
//  ViewController.swift
//  webCrawlerCode
//
//  Created by wyx on 2018/7/21.
//  Copyright © 2018 LifeAnalysis Lab. All rights reserved.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {
    
    var pageResult = [Page]()
    var successPrint: String!
    var skippedPrint: String!
    var errorPrint: String!
    var testCases = ["test1", "test2"]
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    
    // MARK: JSON
    // Parse the JSON file inside the project, see 'test1.json'
    // Read and store each to model Post. For a better data perserve and future using
    func parse(_ filename: String) {
        do {
            if let path = Bundle.main.url(forResource: filename, withExtension: "json"){
                let data = try Data(contentsOf: path)
                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                if let pages = json!["pages"] as? [[String:Any]] {
                    for p in pages {
                        let address = p["address"] as! String
                        let links = p["links"] as! [String]
                        pageResult.append(Page(address: address, links: links)!)
                    }
                    // All parsing done. Now crawler the stuff
                    crawler()
                }
            }
        } catch {
            print("Error loading and parsing JSON: \(error)")
        }
        
    }
    
    
    
    // MARK: Crawler
    // Crawler the links to valid, skip, error category
    func crawler() {
        var allValid = [String]()
        var allLinks = [String]()
        for p in pageResult {
            allValid.append(p.address)
            for l in p.links {
                allLinks.append(l)
            }
        }
        
        var valid = [String]()
        var skipped = [String]()
        var error = [String]()
        valid.append(allValid[0])
        for l in allLinks {
            if (allValid.contains(l)) {
                if (!valid.contains(l)) {
                    valid.append(l);
                } else {
                    if (!skipped.contains(l)) {
                        skipped.append(l);
                        
                    }
                }
            } else {
                if (!error.contains(l)) {
                    error.append(l);
                }
            }
        }
        
        // Passing the array and string to update the three print String
        successPrint = storeString(valid, str: "Success: ")
        skippedPrint = storeString(skipped, str: "Skipped: ")
        errorPrint = storeString(error, str: "Error: ")
        // If you want to test it without using the interface in app, uncomment and the Output field will have it.
        print(successPrint!)
        print(skippedPrint!)
        print(errorPrint!)
    }
    
    
    func storeString(_ array: [String], str: String) -> String {
        var s = str;
        if (array.isEmpty) {
            s.append("[]")
        } else {
            s.append("[")
            for a in array {
                s.append("\(a), ")
            }
            // Remove the last two character since we will not need to specific treat the last case withou append ", "
            s.removeSubrange(Range(uncheckedBounds: (lower: s.index(s.endIndex, offsetBy: -2), upper: s.endIndex)))
            s.append("]")
        }
        return s;
    }
    
    
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cellIdentifier = "TableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! TableViewCell
        let test = testCases[indexPath.row]
        cell.testLabel.text = test
        
        return cell
    }
    
    
    
    // MARK: Click Select Row Action
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let test = testCases[indexPath.row]
        parse(test)
        let alert = UIAlertController(title: test, message: "\(successPrint!)\n\n\(skippedPrint!)\n\n\(errorPrint!)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Done", style: .default) { _ in
        })
        self.present(alert, animated: true) {}
    }
    
    
}





