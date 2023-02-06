//
//  MoviesCollectionViewController.swift
//  flixster
//
//  Created by Dev Patel on 2/4/23.
//

import UIKit
import Nuke

class MoviesCollectionViewController: UIViewController, UICollectionViewDataSource {
    
    var movies: [Movie] = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        overrideUserInterfaceStyle = .dark
        
        /*
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
         
        navigationItem.standardAppearance = appearance
        */
        
        let url = URL(string: "https:api.themoviedb.org/3/movie/now_playing?api_key=68d63fb0346c4fb2422a602de8698de4")!
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            
            // Handle any errors
            if let error = error {
                print("❌ Network error: \(error.localizedDescription)")
            }

            // Make sure we have data
            guard let data = data else {
                print("❌ Data is nil")
                return
            }

            do {
                let decoder = JSONDecoder()

                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let response = try decoder.decode(MoviesResponse.self, from: data)
                let movies = response.results
                
                DispatchQueue.main.async {
                    self?.movies = movies
                    self?.collectionView.reloadData()
                }
            } catch {
                print("❌ Error parsing JSON: \(error.localizedDescription)")
            }

        }
        
        task.resume()
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        
        let numberOfColumns: CGFloat = 3
        
        let width = collectionView.bounds.width / numberOfColumns
        
        layout.itemSize = CGSize(width: width, height: 2 * width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCollectionCell", for: indexPath) as! MovieCollectionCell
        
        let movie = movies[indexPath.item]
        
        let imageURL = URL(string: Movie.posterBaseURLString200 + movie.posterPath)!
        
        Nuke.loadImage(with: imageURL, into: cell.moviePosterImage)
        
        return cell
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
        if let cell = sender as? UICollectionViewCell,
           let indexPath = collectionView.indexPath(for: cell),
           let detailViewController = segue.destination as? DetailViewController {
            let movie = movies[indexPath.item]
            
            detailViewController.movie = movie
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
}
