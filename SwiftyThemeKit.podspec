Pod::Spec.new do |s|
  s.name = 'SwiftyThemeKit'
  s.version = '0.1.5'
  s.license = 'MIT'
  s.summary = 'Elegant Theme Kit in Swift'
  s.homepage = 'https://github.com/octree/SwiftyThemeKit'
  s.authors = { 'Octree' => 'fouljz@gmail.com' }
  s.source = { :git => 'https://github.com/octree/SwiftyThemeKit.git', :tag => s.version }
  s.documentation_url = 'https://github.com/octree/SwiftyThemeKit'

  s.ios.deployment_target = '9.0'

  s.source_files = 'ThemeKit/**/*.swift'
end