//
//  HomeTableViewCell.swift
//  Reto_Tenico_Jose_Quispe_R
//
//  Created by MACJOSE on 22/11/23.
//

import UIKit
import SDWebImage

protocol tappedCell: AnyObject  {
    func detailPressed(info: UserResult)
    func mapPressed(info: UserResult)
}

public class HomeTableViewCell: UITableViewCell, ReusableViewCell {
    
 
    
    let baseView: UIView = {
         let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
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
           stackView.spacing = 12
           stackView.translatesAutoresizingMaskIntoConstraints = false
           return stackView
       }()
       
       private let nameLabel: UILabel = {
           let label = UILabel()
          
           label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()
       
       private let ageLabel: UILabel = {
           let label = UILabel()
          
           label.font = UIFont.systemFont(ofSize: 14)
           label.translatesAutoresizingMaskIntoConstraints = false
           return label
       }()

    private let buttonStackView: UIStackView = {
          let stackView = UIStackView()
          stackView.axis = .vertical
          stackView.distribution = .equalSpacing
          stackView.spacing = 8
          stackView.translatesAutoresizingMaskIntoConstraints = false
          return stackView
      }()
    
    public let button1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Detail", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.backgroundColor = .shadow
        
        return button
    }()
    
    public let button2: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Map", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.backgroundColor = .shadow
        
        return button
    }()

   
     weak var delegate: tappedCell? = nil
    
     override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
         super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupView()
     }

    
    var userResult: UserResult? = nil
    
    static var cellType: String {
        return String(describing: self)
    }
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(baseView)
        baseView.addSubview(profileImageView)
        
        baseView.addSubview(infoStackView)
        infoStackView.addArrangedSubview(nameLabel)
        infoStackView.addArrangedSubview(ageLabel)
        
        baseView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(button1)
        buttonStackView.addArrangedSubview(button2)
        
        NSLayoutConstraint.activate([
            baseView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            baseView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            baseView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            baseView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            
            profileImageView.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 10),
            profileImageView.widthAnchor.constraint(equalToConstant: 90),
            profileImageView.heightAnchor.constraint(equalToConstant: 90),
            profileImageView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor, constant: 0),
            
            
            buttonStackView.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -10),
            buttonStackView.widthAnchor.constraint(equalToConstant: 100),
            buttonStackView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor, constant: 0),
            
            infoStackView.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 10),
            infoStackView.widthAnchor.constraint(equalToConstant: 150),
            infoStackView.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor, constant: 10),
            infoStackView.centerYAnchor.constraint(equalTo: baseView.centerYAnchor),
            
        ])

        DispatchQueue.main.async {
            self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width / 2
            self.profileImageView.clipsToBounds = true
            self.baseView.addNewShadow(shadowColor: .shadow)
            
        }
        button1.addTarget(self, action: #selector(buttonTapped1), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped2), for: .touchUpInside)
       }

    @objc func buttonTapped1() {
        if let data = self.userResult {
            self.delegate?.detailPressed(info: data)
        }
       
    }
    
    @objc func buttonTapped2() {
        if let data = self.userResult {
            self.delegate?.mapPressed(info: data)
        }
    }
    
    
    func displayInformation(_ info: UserResult, _ index: Int) {
        self.userResult = info
        if let imageUrl = URL(string: info.picture?.large ?? "") {
            profileImageView.sd_setImage(with: imageUrl, placeholderImage: UIImage(named: "placeholder"))
        }
        
        if let unwrappedName = info.name {
            
            if let firstName = unwrappedName.first {
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
