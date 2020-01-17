//
//  ViewController.swift
//  StormViewer
//
//  Created by Matt Lichtenstein on 1/14/20.
//  Copyright © 2020 Matt Lichtenstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let fm = FileManager.default
    let path = Bundle.main.resourcePath!

    var pictures = [String]()

    let tableView = UITableView()
    
    let pictureViewController = PictureViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pictures"
        view.backgroundColor = .systemBackground
        getPictureFileNames()
        createTableView()
    }

    func getPictureFileNames() {
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    func createTableView() {
        view.addSubview(tableView)
        tableView.tableFooterView = UIView() //get rid of extra separator lines
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "pictureCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pictureCell", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pictureViewController.selectedImage = pictures[indexPath.row]
        self.navigationController?.pushViewController(pictureViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
