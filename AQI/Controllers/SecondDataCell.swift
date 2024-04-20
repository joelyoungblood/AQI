//
//  SecondDataCell.swift
//  AQI
//
//  Created by Joel Youngblood on 4/20/24.
//

import UIKit

final class SecondDataCell: UITableViewCell, ReusableView {
    private let pm25Label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "PM 2-5:"
        return label
    }()
    
    private let pm25ValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let pm10Label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "PM10:"
        return label
    }()
    
    private let pm10ValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let nh3Label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "NH3:"
        return label
    }()
    
    private let nh3ValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        selectionStyle = .none
        contentView.backgroundColor = .blue3
        
        addSubview(pm25Label)
        pm25Label.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(45)
            make.top.equalToSuperview().inset(25)
        }
        
        addSubview(pm25ValueLabel)
        pm25ValueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(pm25Label.snp.centerY)
            make.leading.equalTo(pm25Label.snp.trailing).offset(15)
        }
        
        addSubview(pm10Label)
        pm10Label.snp.makeConstraints { make in
            make.leading.equalTo(pm25Label)
            make.top.equalTo(pm25Label.snp.bottom).offset(15)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        addSubview(pm10ValueLabel)
        pm10ValueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(pm10Label.snp.centerY)
            make.leading.equalTo(pm10Label.snp.trailing).offset(15)
        }
        
        addSubview(nh3Label)
        nh3Label.snp.makeConstraints { make in
            make.centerY.equalTo(pm25Label.snp.centerY)
            make.leading.equalTo(pm25Label.snp.trailing).offset(105)
        }
        
        addSubview(nh3ValueLabel)
        nh3ValueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(nh3Label.snp.centerY)
            make.leading.equalTo(nh3Label.snp.trailing).offset(15)
        }
    }
    
    func configure(values: AirQualityComponents?) {
        pm25ValueLabel.text = "\(values?.pm2_5 ?? 0)"
        pm10ValueLabel.text = "\(values?.pm10 ?? 0)"
        nh3ValueLabel.text = "\(values?.nh3 ?? 0)"
    }
}
