//
//  DetailViewController.swift
//  flixster
//
//  Created by Dev Patel on 1/29/23.
//

import UIKit
import Nuke

class DetailViewController: UIViewController {
    var movie: Movie!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        
        Nuke.loadImage(with: URL(string: Movie.backdropBaseURLString + movie.backdropPath)!, into: movieImage)
        
        movieTitle.text = movie.originalTitle
        
        //movieVoteAverage.text =
        movieVoteAverage.attributedText = NSAttributedString(string: "\(movie.voteAverage) Vote Average", attributes:
            [.underlineStyle: NSUnderlineStyle.thick.rawValue])
        
        //movieVoteCount.text = "\(movie.voteCount) Vote Count"
        movieVoteCount.attributedText = NSAttributedString(string: "\(movie.voteCount) Vote Count", attributes:
            [.underlineStyle: NSUnderlineStyle.thick.rawValue])
        
        moviePopularity.text = "\(movie.popularity) Popularity"
        /*
        moviePopularity.attributedText = NSAttributedString(string: "\(movie.popularity) Popularity", attributes:
            [.underlineStyle: NSUnderlineStyle.thick.rawValue])
         */
        
        movieOverview.text = movie.overview
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "similarMoviesSegue" {
            let movieListViewController = segue.destination as? MovieListViewController
            movieListViewController?.similarMovieId = movie.id
        }
    }
    
    @IBAction func similarMovies(_ sender: UIButton) {
        performSegue(withIdentifier: "similarMoviesSegue", sender: sender)
    }
    

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieVoteAverage: UILabel!
    @IBOutlet weak var movieVoteCount: UILabel!
    @IBOutlet weak var moviePopularity: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
}
