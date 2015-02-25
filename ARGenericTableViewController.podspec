Pod::Spec.new do |s|
  s.name         = 'ARGenericTableViewController'
  s.version      = '1.0.3'
  s.license  = { :type => 'MIT'}
  s.summary      = 'iOS component to configure TableViews.'
  s.homepage = 'https://github.com/vertigo/ARGenericTableViewController'
  s.author = {
    'arconsis IT-Solutions GmbH' => 'jonas.stubenrauch@arconsis.com'
  }
  s.source = {
    :git => 'https://github.com/vertigo/ARGenericTableViewController.git',
    :tag => '1.0.3'
  }
  s.platform = :ios,'5.0'
  s.source_files = 'Classes', 'Classes/**/*.{h,m}'
  s.requires_arc = true
end
