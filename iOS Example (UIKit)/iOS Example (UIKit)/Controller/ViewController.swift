//
//  ViewController.swift
//  iOS Example (UIKit)
//
//  Created by Wolf on 01/06/2023.
//

import UIKit

class ViewController: UIViewController {
  // - Private
  // - Constants
  private static let cellId = ""
  private static let segueId = ""

  // - Props
  private let videoList = [
    ""
  ]

  // - Internal
  // - IBOutlets & Views
  @IBOutlet var tableView: UITableView!

  // - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.tableFooterView = .init()
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return videoList.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // ...
    return .init()
  }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let selectedItem = videoList[indexPath.row]
    performSegue(withIdentifier: Self.segueId, sender: selectedItem)
  }
}

// MARK: - Navigation
extension ViewController {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // TODO: ...
  }
}
