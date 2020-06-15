import UIKit
import DcCore

extension UIImageView {

    func loadVideoThumbnail(from url: URL, placeholderImage: UIImage?, completionHandler: ((UIImage?)->Void)?) {

        self.image = placeholderImage
        DispatchQueue.global(qos: .background).async {
            let thumbnailImage = DcUtils.generateThumbnailFromVideo(url: url)
            DispatchQueue.main.async { [weak self] in
                self?.image = thumbnailImage
                completionHandler?(thumbnailImage)
            }
        }
    }
}
