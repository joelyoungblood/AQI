//
//  AQIViewController.swift
//  AQI
//
//  Created by Joel Youngblood on 4/18/24.
//

import UIKit
import Combine
import CoreLocation

fileprivate enum ViewSections: Int, CaseIterable {
    case header
    case dataSection1
    case dataSection2
}

final class AQIViewController: UIViewController {
    private let location = Location()
    private var subscriptions = Set<AnyCancellable>()
    private let viewModel = AQIViewModel()
    private var airQualityComponents: AirQualityComponents?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.backgroundColor = .blue4
        tableView.separatorStyle = .none
        tableView.sectionFooterHeight = 0.0
        tableView.alwaysBounceVertical = false
        tableView.register(AQIHeaderCell.self)
        tableView.register(FirstDataCell.self)
        tableView.register(SecondDataCell.self)
        return tableView
    }()
    
    override func viewDidLoad() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        view.backgroundColor = .white
        if location.manager.authorizationStatus == .notDetermined {
            location.manager.requestWhenInUseAuthorization()
        }
        
        location.authorizationStatus.sink(receiveValue: { [weak self] authStatus in
            switch authStatus {
            case .denied, .restricted:
                let alert = UIAlertController(title: "Please give location acces", message: "This app cannot function with access to your location, please provide it", preferredStyle: .actionSheet)
                let action = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
                alert.addAction(action)
                self?.present(alert, animated: true, completion: nil)
            default:
                break
            }
        }).store(in: &subscriptions)
        
        location.coordinates.sink(receiveValue: { [weak self] coordinates in
            self?.coordinatesReceivedForSearch(coordinates: coordinates)
        }).store(in: &subscriptions)
    }
    
    func coordinatesReceivedForSearch(coordinates: CLLocationCoordinate2D) {
        viewModel.request(longitude: coordinates.longitude, latitude: coordinates.latitude)
            .receive(on: DispatchQueue.main).sink(receiveCompletion: { _ in }, receiveValue: { [weak self] object in
                print(object)
                self?.airQualityComponents = object.responseArray.first?.components
                self?.tableView.reloadData()
        }).store(in: &subscriptions)
    }
}


extension AQIViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ViewSections.allCases.count
    }
}

extension AQIViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = ViewSections(rawValue: indexPath.row)!
        switch section {
        case .header:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as AQIHeaderCell
            return cell
        case .dataSection1:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as FirstDataCell
            cell.configure(values: airQualityComponents)
            return cell
        case .dataSection2:
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as SecondDataCell
            cell.configure(values: airQualityComponents)
            return cell
        }
    }
}
