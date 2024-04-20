//
//  AQIDataCell.swift
//  AQI
//
//  Created by Joel Youngblood on 4/20/24.
//

import UIKit
import SnapKit

final class FirstDataCell: UITableViewCell, ReusableView {
    private let coLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "CO:"
        return label
    }()
    
    private let coValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let noLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "NO:"
        return label
    }()
    
    private let noValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let o3Label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "03:"
        return label
    }()
    
    private let o3ValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let so2Label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "SO2:"
        return label
    }()
    
    private let so2ValueLabel: UILabel = {
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
        contentView.backgroundColor = .blue2
        
        addSubview(coLabel)
        coLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(45)
            make.top.equalToSuperview().inset(25)
        }
        
        addSubview(coValueLabel)
        coValueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(coLabel.snp.centerY)
            make.leading.equalTo(coLabel.snp.trailing).offset(15)
        }
        
        addSubview(noLabel)
        noLabel.snp.makeConstraints { make in
            make.leading.equalTo(coLabel)
            make.top.equalTo(coLabel.snp.bottom).offset(15)
            make.bottom.equalToSuperview().offset(-15)
        }
        
        addSubview(noValueLabel)
        noValueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(noLabel.snp.centerY)
            make.leading.equalTo(noLabel.snp.trailing).offset(15)
        }
        
        addSubview(o3Label)
        o3Label.snp.makeConstraints { make in
            make.centerY.equalTo(coLabel.snp.centerY)
            make.leading.equalTo(coLabel.snp.trailing).offset(145)
        }
        
        addSubview(o3ValueLabel)
        o3ValueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(o3Label.snp.centerY)
            make.leading.equalTo(o3Label.snp.trailing).offset(15)
        }
        
        addSubview(so2Label)
        so2Label.snp.makeConstraints { make in
            make.centerY.equalTo(noLabel.snp.centerY)
            make.leading.equalTo(noLabel.snp.trailing).offset(145)
        }
        
        addSubview(so2ValueLabel)
        so2ValueLabel.snp.makeConstraints { make in
            make.centerY.equalTo(so2Label.snp.centerY)
            make.leading.equalTo(so2Label.snp.trailing).offset(15)
        }
    }
    
    func configure(values: AirQualityComponents?) {
        coValueLabel.text = "\(values?.co ?? 0)"
        noValueLabel.text = "\(values?.no ?? 0)"
        o3ValueLabel.text = "\(values?.o3 ?? 0)"
        so2ValueLabel.text = "\(values?.so2 ?? 0)"
    }
}
