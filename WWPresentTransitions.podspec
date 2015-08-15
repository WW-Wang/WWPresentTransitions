Pod::Spec.new do |s|
  s.name             = "WWPresentTransitions"
  s.version          = "0.2.0"
  s.summary          = "A Custom Present Transition Animation On iOS."
  s.description      = <<-DESC
                       It is a Transition Animation When Present a ViewController, which implement by Objective-C.
                       DESC
  s.homepage         = "https://github.com/WW-Wang/WWPresentTransitions"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "WW-Wang" => "wzh464686744@gmail.com" }
  s.source           = { :git => "https://github.com/WW-Wang/WWPresentTransitions.git", :tag => "#{s.version}" }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'TransitionAnimation/*.{h,m}'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
