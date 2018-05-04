Pod::Spec.new do |s|

  s.name                      = 'XCEFontAdjustedLabel'
  s.summary                   = 'Label with precise control over alignment rect.'
  s.version                   = '1.0.0'
  s.homepage                  = 'https://XCEssentials.github.io/FontAdjustedLabel'

  s.source                    = { :git => 'https://github.com/XCEssentials/FontAdjustedLabel.git', :tag => s.version }

  s.requires_arc              = true

  s.license                   = { :type => 'MIT', :file => 'LICENSE' }
  s.author                    = { 'Maxim Khatskevich' => 'maxim@khatskevi.ch' }

  s.swift_version             = '4.1'

  s.ios.deployment_target     = '9.0'

  s.source_files              = 'Sources/**/*.swift'

end
