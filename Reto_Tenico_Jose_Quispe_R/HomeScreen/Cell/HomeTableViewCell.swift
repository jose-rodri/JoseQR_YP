//
//  HomeTableViewCell.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MAC9STRATIS001 on 22/11/23.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell, ReusableViewCell {

    private let baseView: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.layer.cornerRadius = 8
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
       
        return imageView
    }()
        
        private let infoStackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 8
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
        
        private let nameLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            return label
        }()
        
        private let ageLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont.systemFont(ofSize: 14)
            return label
        }()
    
    static var cellType: String {
        return String(describing: self)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addViews()
        addConstraints()
    }
    
    
    
    func addViews() {
       
    }
    
    func addConstraints() {
        addSubview(baseView)
        baseView.addSubview(profileImageView)
        baseView.addSubview(infoStackView)
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(ageLabel)
        
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            baseView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            baseView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            baseView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            profileImageView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 16),
            profileImageView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: 70),
            profileImageView.heightAnchor.constraint(equalToConstant: 70),
            
            
            infoStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16),
            infoStackView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -16),
            infoStackView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor)
        ])
        
        DispatchQueue.main.async {
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
            self.profileImageView.clipsToBounds = true
        }
        
        self.baseView.addNewShadow(shadowColor: .shadow)
    }
    
  
    func displayInformation(_ info: UserResult, _ index: Int) {
           
        if let imageUrl = URL(string: info.picture?.medium ?? "") {
            profileImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder"))
        }
        
        if let unwrappedName = info.name {
            if let firstName = unwrappedName.first {
                print("Name: \(firstName)")
                nameLabel.text = "Name: " + firstName
            } else {
                print("First name is nil.")
            }
        } else {
            print("The Name object is nil.")
        }
        
        ageLabel.text = "Age: " + (info.dob?.age?.description ?? "")
    }
    
    
}
