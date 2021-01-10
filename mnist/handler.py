from torchvision.transforms.transforms import Grayscale
from ts.torch_handler.image_classifier import ImageClassifier
from torchvision import transforms


class CustomHandler(ImageClassifier):
    image_processing = transforms.Compose([
        transforms.Grayscale(),
        transforms.Resize(28),
        transforms.ToTensor(),
        transforms.Normalize((0.1307,), (0.3081,))
    ])
