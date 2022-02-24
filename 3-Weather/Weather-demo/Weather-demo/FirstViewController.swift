//
//  ViewController.swift
//  Weather-demo
//
//  Created by Sanghun Park on 2022/02/23.
//

import UIKit

class FirstViewController: UIViewController {
    
    // MARK: - Properties
    var countries: [Country] = []
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "firstCell"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "World Weather"
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        getCountries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        guard let nextVC: SecondViewController = segue.destination as? SecondViewController else { return }
        
        nextVC.country = self.countries[tableView.indexPathForSelectedRow!.row]
    }

    // MARK: - Methods
    
    // MARK: Custom Methods
    func getCountries() {
        
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: "countries") else { return }
        
        do {
            self.countries = try decoder.decode([Country].self, from: dataAsset.data)
        }
        catch {
            print(error.localizedDescription)
        }
        
        //self.tableView.reloadData()
    }
    
    // MARK: IBActions
}

extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let country = self.countries[indexPath.row]
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.image = UIImage(named: country.imageAssetname)
        content.text = country.koreanName
        
        cell.contentConfiguration = content
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
}
