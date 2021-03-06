//
//  ViewController.swift
//  Wejhuh
//
//  Created by Huda N S on 28/05/1443 AH.
//

import UIKit

class VideoVC : UIViewController , UITableViewDataSource , UITableViewDelegate , ModelDelegate{
    
    var model = Model()
    var videos = [Item]()
    
    @IBOutlet weak var tableViewVideos: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewVideos.dataSource = self
        tableViewVideos.delegate = self
        model.delegate = self
        model.gitVideos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard tableViewVideos.indexPathForSelectedRow != nil else {
            return
        }
        let selectedVideo = videos[tableViewVideos.indexPathForSelectedRow!.row]
        let detailVC = segue.destination as! DetailVC
        detailVC.item = selectedVideo
    }
    
    //ModelDelegate
    func videosFetched(_ videos: [Item]) {
        print(videos)
        self.videos = videos
        tableViewVideos.reloadData()
    }
    
    
    // MARK: - tableView methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constents.videoCellId , for: indexPath) as! VideoTableViewCell
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        return cell
    }
}

