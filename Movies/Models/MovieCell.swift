//
//  MovieCell.swift
//  Movies
//
//  Created by Drew Sullivan on 2/4/20.
//  Copyright © 2020 Drew Sullivan. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var movieTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        update(with: nil, movie: nil)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        update(with: nil, movie: nil)
    }

    func update(with image: UIImage?, movie: Movie?) {
        if let imageToDisplay = image, let movie = movie {
            spinner.stopAnimating()
            imageView.image = imageToDisplay
            movieTitleLabel.text = movie.title
        } else {
            spinner.startAnimating()
            imageView.image = nil
            movieTitleLabel.text = nil
        }
    }

    func setThemeColor(_ indexPath: IndexPath) {
        let section = indexPath.section
        switch section % MovieListType.allCases.count {
            case 0: titleView.backgroundColor = UIColor.Theme.red
            case 1: titleView.backgroundColor = UIColor.Theme.blue
            case 2: titleView.backgroundColor = UIColor.Theme.green
            default: titleView.backgroundColor = UIColor.Theme.orange
        }
    }

}
