//
//  SecondViewController.swift
//  Weather-demo
//
//  Created by Sanghun Park on 2022/02/24.
//

import UIKit

class SecondViewController: UIViewController {

    // MARK: - Properties
    var country: Country?
    var assetTarget: String?
    
    var cities: [City] = []
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "secondCell"
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.assetTarget = self.country?.assetName
        
        getCities()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = self.country?.koreanName
        
        self.tableView.reloadData()
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

    // MARK: - Methods
    
    // MARK: Custom Methods
    func getCities() {
        
        let decoder = JSONDecoder()
        guard let dataAsset = NSDataAsset(name: self.assetTarget!) else { return }
        
        do {
            self.cities = try decoder.decode([City].self, from: dataAsset.data)
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    // MARK: IBActions
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let city = self.cities[indexPath.row]
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        
        content.imageProperties.maximumSize = CGSize(width: 32, height: 32)
        content.image = UIImage(named: city.stateImage)
        content.text = city.cityName
        content.secondaryText = "\(city.celsius) C / \(city.fahrenheit) F, \(city.rainfallProbability)%"
        
        cell.contentConfiguration = content
        
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    
}
