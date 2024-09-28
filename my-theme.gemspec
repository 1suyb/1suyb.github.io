Gem::Specification.new do |spec|
    spec.name          = "my-theme"
    spec.version       = "0.1.0"
    spec.summary       = "My Jekyll Theme"
    spec.description   = "A custom Jekyll theme for my website."
    spec.license       = "MIT"
    spec.authors       = ["Your Name"]
    spec.email         = ["your.email@example.com"]
    spec.homepage      = "https://example.com"
  
    spec.files         = Dir["**/*"]
  
    spec.add_dependency "jekyll", "~> 3.10.0"
  
    spec.metadata["jekyll-theme"] = "my-theme"
  end
  