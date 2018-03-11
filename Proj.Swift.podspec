#
# Be sure to run `pod lib lint Proj.Swift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'Proj.Swift'
  s.version          = '0.1.0'
  s.summary          = 'Use the PROJ library in Swift easily'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This library provides a way to use the PROJ projection library easily in Swift.
                       DESC

  s.homepage         = 'https://github.com/paxswill/Proj.Swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'paxswill' => 'paxswill@paxswill.com' }
  s.source           = { :git => 'https://github.com/paxswill/Proj.Swift.git',
                         :tag => s.version.to_s,
                         :submodules => true }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.8'

  s.compiler_flags = [
    '-DMUTEX_pthread',
  ]

  s.module_name = 'Proj'
  s.source_files = [
    'Proj.Swift/Classes/**/*',
    'proj-src/src/pj_*.{h,c}', 'proj-src/src/PJ_*.{h,c}',
    'proj-src/src/proj_*.{h,c}', 'proj-src/src/proj.h',
    'proj-src/src/projects.h',
    'proj-src/src/aasincos.c', 'proj-src/src/adjlon.c',
    'proj-src/src/bch2bps.c', 'proj-src/src/bchgen.c',
    'proj-src/src/biveval.c', 'proj-src/src/dmstor.c',
    'proj-src/src/mk_cheby.c', 'proj-src/src/vector1.c',
    'proj-src/src/nad_*', 'proj-src/src/emess.{h,c}',
    'proj-src/src/geocent.{h,c}', 'proj-src/src/geodesic.c',
  ]
  s.public_header_files = [
    'proj-src/src/proj.h',
    'proj-src/src/proj_api.h'
  ]
  s.private_header_files = [
    'proj-src/src/projects.h', 'proj-src/src/proj_internal.h'
  ]
  s.resource_bundles = {
    'ProjData' => ['proj-src/nad/*', 'proj-datumgrid/*']
  }
  s.exclude_files = [
    '**/*.in', '**/*.am', '**/CMakeLists.txt',
    'proj-src/**/README', 'proj-src/nad/test*', 'proj-src/nad/*.dist*', 
    'proj-datumgrids/HOWTORELEASE', 'proj-datumgrids/README-DATUMGRID',
  ]

  s.libraries = 'pthread'
  s.dependency 'Threadly', '~> 2.0.1'
end