//
//  AQIHeaderCell.swift
//  AQI
//
//  Created by Joel Youngblood on 4/20/24.
//

import UIKit

final class AQIHeaderCell: UITableViewCell, ReusableView {
    private let sunImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")?.withTintColor(.white)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        label.text = "Air Quality Index"
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
        contentView.backgroundColor = .blue1
        contentView.addSubview(sunImage)
        sunImage.snp.makeConstraints { make in
            make.height.equalTo(80.0)
            make.top.equalTo(contentView.snp.top).offset(15.0)
            make.leading.equalTo(contentView.snp.leading).offset(25.0)
            make.bottom.equalTo(contentView.snp.bottom).offset(-15.0)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalTo(sunImage.snp.centerY)
            make.centerX.equalTo(contentView.snp.centerX).offset(20.0)
        }
    }
}
