//
//  CollectionViewTableViewCell.swift
//  NetFlick
//
//  Created by Hung Vu on 17/04/2023.
//

import UIKit

class CollectionViewTableViewCell: UITableViewCell {
    static let identifier = "CollectionViewTableViewCell"
    
    private var titles: [Title] = [Title]()
    
    private let collectionView: UICollectionView  = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 140, height: 200)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(TitleCollectionViewCell.self, forCellWithReuseIdentifier:TitleCollectionViewCell.identifer)
        return collectionView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGreen
        contentView.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        collectionView.frame = contentView.bounds
    }
    
    public func configure(with titles:[Title]){
        self.titles = titles
        DispatchQueue.main.sync {
            [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
}


extension CollectionViewTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource{
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titles.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleCollectionViewCell.identifer, for: indexPath) as? TitleCollectionViewCell else {
                  return UICollectionViewCell()
              }
        guard let model = titles[indexPath.row].poster_path else{
            return UICollectionViewCell()
        }
        cell.configure(with: model)
        return cell
    }
    
    
}
