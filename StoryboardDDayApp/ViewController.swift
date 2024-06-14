//
//  ViewController.swift
//  StoryboardDDayApp
//
//  Created by racoon on 6/13/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sheet = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath)
        
        return sheet
    }
    
    
}
