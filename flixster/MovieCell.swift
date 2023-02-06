//
//  MovieCell.swift
//  flixster
//
//  Created by Dev Patel on 1/29/23.
//

import UIKit
import Nuke

class MovieCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with movie: Movie) {
        movieTitle.text = movie.originalTitle
        movieOverview.text = movie.overview
        
        Nuke.loadImage(with: URL(string: Movie.posterBaseURLString200 + movie.posterPath)!, into: posterImageView)
    }
    

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
}
