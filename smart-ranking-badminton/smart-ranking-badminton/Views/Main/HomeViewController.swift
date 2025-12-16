import UIKit

final class HomeViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var categories: [Category] = Category.getDummyDatas()
    
    private let cellReuseIdentifier = "MCollection"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
//        configureCollectionView()
    }
    
    private func configureCollectionView() {
        // Register the nib for your custom cell
        let nib = UINib(nibName: "MCollection", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellReuseIdentifier)
        
        // Set delegate and data source
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Optional: improve performance and appearance
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellReuseIdentifier,
            for: indexPath
        ) as? MCollection else {
            fatalError("Failed to dequeue MCollection. Check that the reuse identifier and nib name match.")
        }
        
        let category = categories[indexPath.item]
        
        cell.btnAction.setTitle(category.category, for: .normal)
        cell.iconImageView.image = UIImage(named: category.image) ?? UIImage(systemName: "photo")
        
        return cell
    }
    
    // Optional: Add selection handling if needed
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let selectedCategory = categories[indexPath.row]
        print("Selected category: \(selectedCategory.category)")
        // Perform navigation or action here
    }
}

// MARK: - Optional: UICollectionViewDelegateFlowLayout (for custom sizing)

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // Example: 2 columns with spacing
        let padding: CGFloat = 16
        let interItemSpacing: CGFloat = 12
        let availableWidth = collectionView.bounds.width - (padding * 2) - interItemSpacing
        let itemWidth = availableWidth / 2
        
        return CGSize(width: itemWidth, height: itemWidth * 1.2) // Adjust ratio as needed
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}
