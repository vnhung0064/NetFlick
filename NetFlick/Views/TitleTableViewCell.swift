//
//  TitleTableViewCell.swift
//  NetFlick
//
//  Created by Hung Vu on 20/04/2023.
//

import UIKit

class TitleTableViewCell: UITableViewCell {
    
    static let identifier = "TitleCollectionViewCell"
    
    private let Playbutton: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "play.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 40))
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private let titlesPosterUIImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titlesPosterUIImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(Playbutton)
        
        applyConstraints()
        
    }
    func applyConstraints(){
        let titlesPosterUIImageViewConstraints = [
                    titlesPosterUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                    titlesPosterUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
                    titlesPosterUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
                    titlesPosterUIImageView.widthAnchor.constraint(equalToConstant: 100)
                    
                ]
        let titleLabelConstraints = [
                   titleLabel.leadingAnchor.constraint(equalTo: titlesPosterUIImageView.trailingAnchor, constant: 20),
                   titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
               ]
               
               
            let playTitleButtonConstraints = [
                   Playbutton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                   Playbutton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
               ]
               
               NSLayoutConstraint.activate(titlesPosterUIImageViewConstraints)
               NSLayoutConstraint.activate(titleLabelConstraints)
               NSLayoutConstraint.activate(playTitleButtonConstraints)
                    }
    required init(coder: NSCoder) {
        fatalError()
    }
      public func configure(with model: TitleViewModel) {

          guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.posterURL)") else {
              return
          }
          titlesPosterUIImageView.sd_setImage(with: url, completed: nil)
          titleLabel.text = model.titleName
      }
    
    
}

    
