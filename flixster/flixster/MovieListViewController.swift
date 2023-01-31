//
//  MovieListViewController.swift
//  flixster
//
//  Created by Anderson David on 1/20/23.
//

import UIKit

class MovieListViewController: UIViewController, UITableViewDataSource {
    
    var movies: [Movie] = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        overrideUserInterfaceStyle = .dark
        
        let appearance = UINavigationBarAppearance()
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
         
        navigationItem.standardAppearance = appearance
        
        movies = MoviesResponse.loadJson()
                
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Deselects the MovieCell that was selected
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Create a reusable table cell that is casted as a MovieCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        
        let movie = movies[indexPath.row]
        
        // Configure the cell with the proper movie
        cell.configure(with: movie)
        
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
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell),
           let detailViewController = segue.destination as? DetailViewController {
            let movie = movies[indexPath.row]
            
            detailViewController.movie = movie
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
}
